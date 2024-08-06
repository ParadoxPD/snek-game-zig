const std = @import("std");
const raylib = @import("raylib");
const Game = @import("game.zig");
const Utils = @import("util.zig");
const Snake = Game.Snake;
const Food = Game.Food;
const Player = Game.Player;
const Vector = Utils.Vector;

var prng = std.Random.DefaultPrng.init(42);
const rand = prng.random();

var screenWidth: c_int = 1000;
var screenHeight: c_int = 1000;
const windowTitle = "Snek";
const windowFPS: c_int = 60;
var frameCount: c_int = 0;
const grid: c_int = 20;

pub fn main() void {

    // Initialization
    const xGridSize: c_int = @divFloor(screenWidth, grid);
    // const yGridSize: c_int = screenHeight / grid;
    const backgroundColor = raylib.Color.init(40, 44, 52, 100);
    var snake = Snake.initRandomLocation(0, 0, screenWidth, screenHeight, Vector.init(1, 0), 5, xGridSize);
    var food = Food.initRandomLocation(0, 0, screenWidth, screenHeight, xGridSize, 5);

    // _ = .{ snake, food };

    raylib.initWindow(screenWidth, screenHeight, windowTitle);
    defer raylib.closeWindow();

    // const display = raylib.getCurrentMonitor();
    // screenWidth = raylib.getMonitorWidth(display);
    // screenHeight = raylib.getMonitorHeight(display);
    raylib.setWindowSize(screenWidth, screenHeight);
    // raylib.toggleFullscreen();

    raylib.setTargetFPS(windowFPS);

    // Main game loop
    while (!raylib.windowShouldClose()) {
        if (raylib.isKeyPressed(raylib.KeyboardKey.key_q)) {
            raylib.toggleFullscreen();
        }
        raylib.clearBackground(backgroundColor);

        raylib.beginDrawing();
        defer raylib.endDrawing();

        draw(food, snake);
        update(&food, &snake);
    }
}

fn checkKeyPressed(snake: *Snake) void {
    //key_right = 262,
    // key_left = 263,
    // key_down = 264,
    // key_up = 265,
    if (raylib.isKeyPressed(raylib.KeyboardKey.key_right) and snake.getHeadDirection().getX() != -1) {
        snake.setHeadDirection(Vector.init(1, 0));
    } else if (raylib.isKeyPressed(raylib.KeyboardKey.key_left) and snake.getHeadDirection().getX() != 1) {
        snake.setHeadDirection(Vector.init(-1, 0));
    } else if (raylib.isKeyPressed(raylib.KeyboardKey.key_up) and snake.getHeadDirection().getY() != 1) {
        snake.setHeadDirection(Vector.init(0, -1));
    } else if (raylib.isKeyPressed(raylib.KeyboardKey.key_down) and snake.getHeadDirection().getY() != -1) {
        snake.setHeadDirection(Vector.init(0, 1));
    }
}

fn draw(food: Food, snake: Snake) void {
    drawFood(food);
    drawSnake(snake);
}

fn drawFood(food: Food) void {
    raylib.drawRectangle(food.getPosition().getX(), food.getPosition().getY(), food.getGridSize(), food.getGridSize(), raylib.Color.init(100, 100, 100, 255));
    return;
}

fn drawSnake(snake: Snake) void {
    raylib.drawRectangle(snake.getHeadPosition().getX(), snake.getHeadPosition().getY(), snake.getGridSize(), snake.getGridSize(), raylib.Color.init(200, 200, 200, 255));
    return;
}

fn update(food: *Food, snake: *Snake) void {
    checkHeadCollison(food, snake);
    checkKeyPressed(snake);
    updateSnake(snake);
}

fn checkHeadCollison(food: *Food, snake: *Snake) void {
    if (isCollided(food.getPosition(), snake.getHeadPosition())) {
        updateFoodLocation(food);
    }
}

fn isCollided(foodLocation: Vector, headLocation: Vector) bool {
    _ = .{ foodLocation, headLocation };
    return true;
}

fn updateSnake(snake: *Snake) void {
    var newPosition = Vector.add(snake.getHeadPosition(), Vector.multiplyScalar(snake.getHeadDirection(), snake.getSpeed()));

    if (newPosition.getX() < 0) {
        newPosition.setX(screenWidth);
    } else if (newPosition.getX() > screenWidth) {
        newPosition.setX(0);
    }

    if (newPosition.getY() < 0) {
        newPosition.setY(screenHeight);
    } else if (newPosition.getY() > screenHeight) {
        newPosition.setY(0);
    }

    snake.setHeadPosition(newPosition);
}

fn updateFoodLocation(food: *const Food) void {
    food.setPosition(Vector.initRandom(0, 0, screenWidth, screenHeight));
}
