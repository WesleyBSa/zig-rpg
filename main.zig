const std = @import("std");
const Character = @import("character.zig").Character;

pub fn main() void {
    var hero = Character.init("Hero", 10, 5, 8, 3);
    var enemy = Character.init("Goblin", 7, 3, 5, 1);

    std.debug.print("Hero: {s}\n", .{hero.describe()});
    std.debug.print("Enemy: {s}\n", .{enemy.describe()});

    const damage = hero.attack();
    std.debug.print("Hero attacks with {} damage!\n", .{damage});

    enemy.takeDamage(damage);
    std.debug.print("Enemy's health after attack: {}\n", .{enemy.getHealth()});
}
