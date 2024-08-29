all: rustsbi-qemu.bin test-kernel.bin

CROSS_COMPILE = riscv64-linux-gnu-
PATCHES = ../miralis_rustsbi_qemu.patch

.PHONY:  clean

rustsbi-qemu:
	-git clone --depth 1 https://github.com/rustsbi/rustsbi-qemu.git
	cd rustsbi-qemu && git apply $(PATCHES)

rustsbi-qemu.bin: rustsbi-qemu
	cd rustsbi-qemu && cargo make --debug
	cp ./rustsbi-qemu/target/riscv64imac-unknown-none-elf/debug/rustsbi-qemu rustsbi-qemu.elf
	cp ./rustsbi-qemu/target/riscv64imac-unknown-none-elf/debug/rustsbi-qemu.bin rustsbi-qemu.bin

test-kernel.bin:
	cd rustsbi-qemu && cargo make --kernel test-kernel --debug
	cp ./rustsbi-qemu/target/riscv64imac-unknown-none-elf/debug/test-kernel test-kernel.elf
	cp ./rustsbi-qemu/target/riscv64imac-unknown-none-elf/debug/test-kernel.bin test-kernel.bin

clean:
	-rm -rf rustsbi-qemu *.bin *.elf