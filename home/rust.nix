{ pkgs, inputs, system, ... }:
let
  rust = (with inputs.fenix.packages.${system}; combine [
    rust-analyzer
    stable.cargo
    stable.clippy-preview
    stable.rust-src
    stable.rust-std
    stable.rustc
    stable.rustfmt-preview
		targets.wasm32-unknown-unknown.stable.rust-std
  ]);
in {
  home.packages = with pkgs; [
    cargo-asm
    cargo-expand
    cargo-flamegraph
    cargo-license
    cargo-outdated
    cargo-watch
    cargo-udeps
    linuxPackages.perf
    rust
    starship
    trunk
    wasm-bindgen-cli
  ];
}
