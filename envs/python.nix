{ pkgs }:

pkgs.mkShell {
  name = "python-dev";
  buildInputs = with pkgs; [
    python3 
    pkgs.poetry
    python3Packages.virtualenv
    python3Packages.black

  ];
  shellHook = ''
    echo "🐍 Python development env up"
    export PYTHONPATH=$PWD

    if [ -f pyproject.toml ]; then
      echo "🔧 Detected pyproject.toml — configure the virtual environment"
      poetry env use python3
      poetry install --no-root
      echo "✅ Dependencies successfully installed"
    else
      echo "⚠️ Any pyproject.toml find. Use 'poetry init' to create one"
    fi

  '';
}

