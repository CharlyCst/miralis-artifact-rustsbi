# RustSBI Artifact

This repository automates the build of [RustSBI](https://github.com/rustsbi/rustsbi-qemu) for the purpose of generating artifacts that can be use for integration tests in the Miralis project.

## How to release new artifacts

Create a new tag and push it to upstream, e.g.:

```sh
git tag v0.1.0
git push origin v0.1.0
```

## Binaries
`rustsbi-qemu`: simple rustsbi firmware.

`test-kernel`: simple test kernel that goes with rustsbi-qemu.