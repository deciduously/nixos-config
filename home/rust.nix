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
  ]);
in {
  home.packages = with pkgs; [
    cargo-asm
    cargo-expand
    cargo-flamegraph
    cargo-license
    cargo-outdated
    cargo-udeps
    linuxPackages.perf
    pulldown-cmark
    rust
    starship
    trunk
    wasm-bindgen-cli
  ];
}