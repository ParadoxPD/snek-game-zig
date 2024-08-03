const std = @import("std");
const Vector = @import("util.zig").Vector;

pub const Snake: type = struct {
    length: c_int = 0,
    position: Vector,

    pub fn init() Snake {
        return Snake{
            .length = 0,
            .position = Vector.init(0, 0),
        };
    }
};

pub const Food: type = struct {};
