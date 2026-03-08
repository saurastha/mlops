.PHONY: setup lint format test clean

# Variables
PYTHON = uv run python

# 1. Setup the environment
setup:
	uv sync

# 2. Linting (using Ruff, which is extremely fast and includes flake8/isort rules)
lint:
	uv run ruff check .

# 3. Formatting
format:
	uv run ruff format .

format-check:
	uv run ruff format --check .
# 4. Testing (using pytest)
test:
	uv run pytest tests/

# Makefile additions
load-test:
	uv run locust -f locustfile.py --headless -u 10 -r 2 --run-time 30s --host http://localhost:8000

# 5. Clean up
clean:
	rm -rf .venv
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type d -name ".pytest_cache" -exec rm -rf {} +
	find . -type d -name ".ruff_cache" -exec rm -rf {} +
