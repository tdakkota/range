// Python like range() for Zig.

const std = @import("std");

const RangeIterator = struct {
    const Self = @This();

    max: i32,
    current: i32,

    pub fn next(self: *Self) ?i32 {
        if (self.current - self.max == 1) return null;
        defer self.current += 1;

        return self.current;
    }
};

pub fn range(count: i32) RangeIterator {
    return RangeIterator{.max = count - 1, .current = 0};
}
