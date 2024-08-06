const std = @import("std");
const Vector = @import("util.zig").Vector;

pub const Snake: type = extern struct {
    length: c_int = 1,
    gridSize: c_int,
    headPosition: Vector,
    headDirection: Vector,
    speed: c_int,

    pub fn init() Snake {
        return Snake{
            .length = 1,
            .headPosition = Vector.init(0, 0),
            .headDirection = Vector.init(0, 0),
            .speed = 0,
        };
    }

    pub fn initRandomLocation(x1: c_int, y1: c_int, x2: c_int, y2: c_int, direction: Vector, speed: c_int, gridSize: c_int) Snake {
        return Snake{
            .length = 1,
            .headPosition = Vector.initRandom(x1, y1, x2, y2),
            .headDirection = direction,
            .speed = speed,
            .gridSize = gridSize,
        };
    }

    pub fn getHeadPosition(self: Snake) Vector {
        return self.headPosition;
    }

    pub fn setHeadPosition(self: *Snake, pos: Vector) void {
        self.headPosition = pos;
    }

    pub fn getHeadDirection(self: Snake) Vector {
        return self.headDirection;
    }

    pub fn setHeadDirection(self: *Snake, direction: Vector) void {
        self.headDirection = direction;
    }

    pub fn getSpeed(self: Snake) c_int {
        return self.speed;
    }

    pub fn setSpeed(self: *Snake, speed: Vector) void {
        self.speed = speed;
    }

    pub fn getLenght(self: Snake) c_int {
        return self.length;
    }

    pub fn setLength(self: *Snake, length: c_int) void {
        self.length = length;
    }

    pub fn getGridSize(self: Snake) c_int {
        return self.gridSize;
    }

    pub fn setGridSize(self: *Snake, gridSize: c_int) void {
        self.gridSize = gridSize;
    }
};

pub const Food: type = extern struct {
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

const Player = extern struct {
    score: c_int = 0,

    pub fn init() Player {
        return Player{
            .score = 0,
        };
    }

    pub fn getScore(self: Player) c_int {
        return self.score;
    }

    pub fn setScore(self: *Player, score: c_int) void {
        self.score = score;
    }
};
