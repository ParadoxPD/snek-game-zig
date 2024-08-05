const std = @import("std");
const Vector = @import("util.zig").Vector;

pub const Snake: type = struct {
    length: c_int = 1,
    headPosition: Vector,
    headDirection: Vector,
    speed: Vector,

    pub fn init() Snake {
        return Snake{
            .length = 1,
            .headPosition = Vector.init(0, 0),
            .headDirection = Vector.init(0, 0),
            .speed = Vector.init(0, 0),
        };
    }
};

pub const Food: type = struct {
    position: Vector,
    gridSize: c_int,
    value: c_int,

    pub fn init(position: Vector, gridSize: c_int, value: c_int) Food {
        return Food{
            .position = position,
            .gridSize = gridSize,
            .value = value,
        };
    }

    pub fn initRandomLocation(x1: c_int, y1: c_int, x2: c_int, y2: c_int, gridSize: c_int, value: c_int) Food {
        return Food{
            .position = Vector.initRandom(x1, y1, x2, y2),
            .gridSize = gridSize,
            .value = value,
        };
    }

    pub fn getPosition(self: Food) Vector {
        return self.position;
    }

    pub fn setPosition(self: *Food, pos: Vector) void {
        self.position = pos;
    }

    pub fn getValue(self: Food) c_int {
        return self.value;
    }

    pub fn setValue(self: *Food, value: c_int) void {
        self.value = value;
    }

    pub fn getGridSize(self: Food) c_int {
        return self.gridSize;
    }

    pub fn setGridSize(self: *Food, gridSize: c_int) void {
        self.gridSize = gridSize;
    }
};
