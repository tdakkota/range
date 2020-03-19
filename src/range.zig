// Python like range() for Zig.

const std = @import("std");

const RangeIterator = struct {
    const Self = @This();

    max: i32,
    current: i32,
    step: i32,

    pub fn next(self: *Self) ?i32 {
        if (self.current - self.max >= self.step) return null;
        defer self.current += self.step;

        return self.current;
    }
};

pub fn range(count: i32) RangeIterator {
    return RangeIterator{.max = count - 1, .current = 0, .step = 1};
}

pub fn range_step(count: i32, step: i32) RangeIterator {
    return RangeIterator{.max = count - 1, .current = 0, .step = step};
}

test "range" {
    var iter = range(10);
    while (iter.next()) |value| {
        std.debug.warn("Current value is {}\n", value);
    }
}

test "range_step" {
    const step: i32 = 2;
    var iter = range_step(10, step);

    var prev : i32 = iter.current; 
    var tmp = iter.next(); // skip first zero value
    while (iter.next()) |value| {
        std.debug.warn("Current value is {}\n", value);
        if (value - prev != step) {
            std.debug.panic("value should be {}, not {}", prev + step, value);
        }
        prev += step;
    }
}