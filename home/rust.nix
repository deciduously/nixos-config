{ pkgs, inputs, system, ... }: {
  home.packages = with pkgs; [
    cargo-asm
    cargo-expand
    cargo-flamegraph
    cargo-license
    cargo-outdated
    cargo-watch
    cargo-udeps
    linuxPackages.perf
    rustup
    starship
    trunk
    wasm-bindgen-cli
  ];
}
