{ pkgs }:

pkgs.mkShell {
  name = "rust-env";
  buildInputs = with pkgs; [
    rustc 
    cargo 
    rustfmt 
    clippy 
    rust-analyzer
    cargo-watch 
    cmake 
    pkg-config 
    openssl 
    libclang
    git
  ];
  shellHook = ''
    echo "🦀 Rust development environment up"
    export RUST_BACKTRACE=1
    export CARGO_INCREMENTAL=1
  '';
}

