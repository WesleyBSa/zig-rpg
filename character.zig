const std = @import("std");

pub const Character = struct {
    name: []const u8,
    health: i32,
    attackPower: i32,
    defense: i32,
    specialPower: i32,

    pub fn init(name: []const u8, health: i32, attackPower: i32, defense: i32, specialPower: i32) Character {
        return Character{
            .name = name,
            .health = health,
            .attackPower = attackPower,
            .defense = defense,
            .specialPower = specialPower,
        };
    }

    pub fn attack(self: *Character) i32 {
        return self.attackPower + @divTrunc(self.specialPower, 2);
    }

    pub fn takeDamage(self: *Character, damage: i32) void {
        const actualDamage = damage - self.defense;
        if (actualDamage > 0) {
            self.health -= actualDamage;
        }
    }

    pub fn getHealth(self: *Character) i32 {
        return self.health;
    }

    pub fn describe(self: *Character) []const u8 {
        return std.fmt.allocPrint(
            std.heap.page_allocator,
            "{s} (HP: {}, ATK: {}, DEF: {}, SP: {})",
            .{ self.name, self.health, self.attackPower, self.defense, self.specialPower }
        ) catch unreachable;
    }
};
