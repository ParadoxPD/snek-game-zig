const std = @import("std");

pub const Vector: type = struct {
    x: c_int,
    y: c_int,

    pub fn init(x: c_int, y: c_int) Vector {
        return Vector{
            .x = x,
            .y = y,
        };
    }

    pub fn getX(self: *Vector) c_int {
        return self.x;
    }
    pub fn setX(self: *Vector, x: c_int) void {
        self.x = x;
    }
    pub fn getY(self: *Vector) c_int {
        return self.y;
    }
    pub fn setY(self: *Vector, y: c_int) void {
        self.y = y;
    }
};

var prng = std.Random.DefaultPrng.init(42);
const rand = prng.random();

fn rand_range(x: c_int, y: c_int) c_int {
    const num: c_int = rand.intRangeAtMost(c_int, x, y);
    return num;
}
