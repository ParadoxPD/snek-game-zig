const std = @import("std");
const raylib = @import("raylib");

pub const Vector: type = struct {
    x: c_int,
    y: c_int,

    pub fn init(x: c_int, y: c_int) Vector {
        return Vector{
            .x = x,
            .y = y,
        };
    }

    pub fn initRandom(x1: c_int, y1: c_int, x2: c_int, y2: c_int) Vector {
        return Vector{
            .x = rand_range(x1, x2),
            .y = rand_range(y1, y2),
        };
    }

    pub fn getX(self: Vector) c_int {
        return self.x;
    }
    pub fn setX(self: Vector, x: c_int) void {
        self.x = x;
    }
    pub fn getY(self: Vector) c_int {
        return self.y;
    }
    pub fn setY(self: Vector, y: c_int) void {
        self.y = y;
    }

    pub fn toVector2(self: Vector) raylib.Vector2 {
        return raylib.Vector2.init(self.x, self.y);
    }
};

var prng = std.Random.DefaultPrng.init(42);
const rand = prng.random();

fn rand_range(x: c_int, y: c_int) c_int {
    const num: c_int = rand.intRangeAtMost(c_int, x, y);
    return num;
}

// fn generate_random_vector(v1: Vector, v2: Vector) Vector {
//     return Vector.init(rand_range(v1.getX(), v2.getX()), rand_range(v1.getY(), v2.getY()));
// }
