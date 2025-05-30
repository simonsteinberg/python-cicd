# python-cicd
A simple Python project with CI/CD

## Setup instructions

1. Install UV
    I am following the instructions provided here:
    https://docs.astral.sh/uv/getting-started/installation/#standalone-installer

    For convenience, uv is published to PyPI, I will use this distribution.
    We first need to install `pipx` (if not already installed) to install `uv`
    into an isolated environment:
    ```bash
    python3 -m pip install --user pipx
    python3 -m pipx ensurepath
    ```

    If that fails, e.g., you are on a Ubuntu system, you can install `pipx` using the package manager:
    ```bash
    sudo apt update
    sudo apt install pipx
    pipx ensurepath
    ```

    Open a new terminal, and install `uv` using `pipx`:
    ```bash
    pipx --version
    uv venv
    ```

2. Create a new project with `uv`
    The command `uv venv` creates a new Python virtual environment in the
    current directory, similar to python -m venv .venv. This environment is
    isolated from your system Python and is used to manage project-specific
    dependencies.
    ```bash
    uv venv
    source .venv/bin/activate
    ```
4. Install dependencies
    Install the project dependencies using `uv`:
    ```bash
    uv pip install -e .
    ```
5. Build the project
    Install `hatchling` to build the project:
    ```bash
    pipx install hatchling
    ```

    Build the project using `uv`:
    ```bash
    uv build
    ```


## Test CI Pipeline using Docker
1. Build the Docker image
    Build the Docker image using the provided Dockerfile:
    ```bash
    docker build -t python-cicd:0.1.0 .
    ```

2. Run the Docker container
    Run the Docker container to test the CI pipeline:
    ```bash
    docker run --rm -it python-cicd:0.1.0
    ```

    ```bash
    docker-compose run --rm ci bash
    ```
