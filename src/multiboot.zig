pub const MULTIBOOT_BOOTLOADER_MAGIC = 0x2BADB002;

const MultibootHeader = packed struct {
    magic:    u32,  // Must be equal to header magic number.
    flags:    u32,  // Feature flags.
    checksum: u32,  // Above fields plus this one must equal 0 mod 2^32.
};

export const multiboot_header align(4) linksection(".multiboot") = multiboot: {
    const MAGIC: u32 = 0x1BADB002;
    const ALIGN: u32 = 1 << 0;
    const MEMINFO: u32 = 1 << 1;
    const FLAGS: u32 = ALIGN | MEMINFO;

    break :multiboot MultibootHeader{
        .magic = MAGIC,
        .flags = FLAGS,
        .checksum = ~(MAGIC +% FLAGS) +% 1,
    };
};

pub const MultibootInfo = packed struct {
    // Multiboot info version number.
    flags: u32,

    // Available memory from BIOS.
    mem_lower: u32,
    mem_upper: u32,

    // "root" partition.
    boot_device: u32,

    // Kernel command line.
    cmdline: u32,

    // Boot-Module list.
    mods_count: u32,
    mods_addr:  u32,

    // TODO: use the real types here.
    u: u128,

    // Memory Mapping buffer.
    mmap_length: u32,
    mmap_addr:   u32,

    // Drive Info buffer.
    drives_length: u32,
    drives_addr:   u32,

    // ROM configuration table.
    config_table: u32,

    // Boot Loader Name.
    boot_loader_name: u32,

    // APM table.
    apm_table: u32,

    // Video.
    vbe_control_info:  u32,
    vbe_mode_info:     u32,
    vbe_mode:          u16,
    vbe_interface_seg: u16,
    vbe_interface_off: u16,
    vbe_interface_len: u16,
};
