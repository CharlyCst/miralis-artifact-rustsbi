all: rustsbi-prototyper-payload-test.bin

RUSTSBI_COMMIT = 4c19e1026116afda9164337cd88e5ea87655d798
RELEASE_DIR = ./rustsbi/target/riscv64gc-unknown-none-elf/release

.PHONY:  clean

rustsbi:
	git init rustsbi
	cd rustsbi && git fetch --depth 1 https://github.com/rustsbi/rustsbi.git $(RUSTSBI_COMMIT) && git checkout FETCH_HEAD

rustsbi-prototyper-payload-test.bin: rustsbi
	cd rustsbi && rustup toolchain install && cargo prototyper test --no-run
	cp $(RELEASE_DIR)/rustsbi-prototyper-payload-test.elf rustsbi-prototyper-payload-test.elf
	cp $(RELEASE_DIR)/rustsbi-prototyper-payload-test.bin rustsbi-prototyper-payload-test.bin

clean:
	-rm -rf rustsbi *.bin *.elf
