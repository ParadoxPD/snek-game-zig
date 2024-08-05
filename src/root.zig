const std = @import("std");
const raylib = @import("raylib");
const Player = @import("player.zig");
const Snake = Player.Snake;
const Food = Player.Food;

var prng = std.Random.DefaultPrng.init(42);
const rand = prng.random();

var screenWidth: c_int = 1000;
var screenHeight: c_int = 1000;
const windowTitle = "Snek";
const windowFPS: c_int = 10;
var frameCount: c_int = 0;
const grid: c_int = 20;

pub fn main() void {

    // Initialization
    const xGridSize: c_int = @divFloor(screenWidth, grid);
    // const yGridSize: c_int = screenHeight / grid;
    const backgroundColor = raylib.Color.init(40, 44, 52, 100);
    const snake: Snake = Snake.init();
    const food: Food = Food.initRandomLocation(0, 0, screenWidth, screenHeight, xGridSize, 5);

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

fn draw(food: Food, snake: Snake) void {
    drawFood(food);
    drawSnake(snake);
}

fn drawFood(food: Food) void {
    raylib.drawRectangle(food.getPosition().getX(), food.getPosition().getY(), food.getGridSize(), food.getGridSize(), raylib.Color.init(100, 100, 100, 255));
    _ = .{food};
    return;
}

fn drawSnake(snake: Snake) void {
    _ = .{snake};
    return;
}

fn update(food: *const Food, snake: *const Snake) void {
    updateSnake(snake);
    updateFoodLocation(food);
}

fn updateSnake(snake: *const Snake) void {
    _ = .{snake};
    return;
}

fn updateFoodLocation(food: *const Food) void {
    _ = .{food};
    return;
}
