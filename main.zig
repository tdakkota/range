const std = @import("std");
const range = @import("src/range.zig").range;

pub fn main() void {
    var iter = range(10);

    while (iter.next()) |value| {
        std.debug.warn("Current value is {}\n", value);
    }
}
