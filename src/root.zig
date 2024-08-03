const std = @import("std");
const raylib = @import("raylib");
const Player = @import("player.zig");
const Snake = Player.Snake;

var prng = std.Random.DefaultPrng.init(42);
const rand = prng.random();

var screenWidth: c_int = 1500;
var screenHeight: c_int = 1000;
const windowTitle = "MaTrIX RaIn";
const windowFPS: c_int = 30;
var frameCount: c_int = 0;

pub fn main() void {

    // Initialization
    const backgroundColor = raylib.Color.init(40, 44, 52, 100);
    const snake: Snake = Snake.init();

    _ = .{snake};

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
    }
}
