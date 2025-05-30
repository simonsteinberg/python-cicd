FROM python:3.12-slim

ENV APP_NAME=myapp
WORKDIR /app

# Update pip and install uv
RUN pip install --upgrade pip

# Install uv and add it to the PATH
RUN pip install uv
ENV PATH="/root/.local/bin:${PATH}"

# Create new virtual environment using uv
RUN uv venv

# Copy necessary files to install third party packages
COPY pyproject.toml .
COPY src/${APP_NAME}/__init__.py src/${APP_NAME}/__init__.py
COPY README.md .
RUN uv pip install .[dev]

# Copy the application code
COPY . .
RUN uv pip install .[dev]

CMD ["bash", "-c", "source .venv/bin/activate && pytest ."]
