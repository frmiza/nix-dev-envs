{ pkgs }:

pkgs.mkShell {
  name = "cpp-env";
  buildInputs = with pkgs; [
    gcc 
    gdb 
    cmake 
    ninja 
    pkg-config
    clang
    llvm
    lldb
    valgrind
  ];
  shellHook = ''
    echo "⚙️ C/C++ development environment up"
  '';
}


