const console = @import("console.zig");
const multiboot = @import("multiboot.zig");
 
export var stack_bytes: [16 * 1024]u8 align(16) linksection(".bss") = undefined;
const stack_bytes_slice = stack_bytes[0..];
 
export fn _start(magic: u32, info: *const multiboot.MultibootInfo) noreturn {
    console.initialize();
    if (magic != 0x2BADB002) {
        console.puts("Something wrong!");
    }
 
    @call(.{ .stack = stack_bytes_slice }, kmain, .{magic, info});

    while (true) {}
}
 
fn kmain(magic: u32, _: *const multiboot.MultibootInfo) void {
    console.puts("Hello world!");
    if (magic != multiboot.MULTIBOOT_BOOTLOADER_MAGIC) {
        console.puts("Something wrong!");
    }
}
