.DEFAULT_GOAL := init

# -----------------------------------------------------------------------------
# Python and virtual environment related
# -----------------------------------------------------------------------------

ifdef VIRTUAL_ENV
VENV_DIR = $(VIRTUAL_ENV)
else ifdef venv
VENV_DIR = $(venv)
else
VENV_DIR = ./.venv
endif

PIP = $(VENV_DIR)/bin/pip
PYTHON = $(VENV_DIR)/bin/python

create-venv:
	uv venv

init: create-venv
	uv sync --all-extras

install: init
	uv run pre-commit autoupdate; \
	uv run pre-commit install --hook-type pre-push --hook-type post-checkout --hook-type pre-commit; \

# -----------------------------------------------------------------------------
# Config, env vars and credentials
# -----------------------------------------------------------------------------

# -----------------------------------------------------------------------------
# Running locally using Python from virtualenv
# -----------------------------------------------------------------------------

shell:
	uv run ipython

# -----------------------------------------------------------------------------
# Docker and deployment
# -----------------------------------------------------------------------------

# Build Docker image
docker-build:
	docker compose build

# Run Docker compose with auth
docker-compose-up:
	docker compose up

# Run Docker compose with auth
docker-compose-up-build:
	docker compose up --build

# -----------------------------------------------------------------------------
# Shortcuts
# -----------------------------------------------------------------------------

docker-run-and-build: docker-build docker-run

clean: clean-build clean-pyc clean-test

# -----------------------------------------------------------------------------
# Cleanup
# -----------------------------------------------------------------------------

clean-build: ## Remove build artifacts
	rm -rf build/
	rm -rf dist/
	rm -rf .eggs/
	find . -name '*.egg-info' -exec rm -rf {} +
	find . -name '*.egg' -exec rm -f {} +

clean-pyc: ## Remove Python file artifacts
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.py,cover' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -rf {} +

clean-test: ## Remove test and coverage artifacts
	rm -f .coverage
	rm -f coverage.xml
	rm -rf htmlcov/
	rm -rf .pytest_cache
	rm -rf .mypy_cache
	rm -rf .ruff_cache

clean-venv: ## Remove venv
	rm -rf .venv

# -----------------------------------------------------------------------------
# Dev handy
# -----------------------------------------------------------------------------

create-secrets:
	uv run detect-secrets scan > .secrets.baseline

detect-secrets:
	uv run detect-secrets scan --baseline .secrets.baseline

pre-commit:
	pre-commit run --all-files

# -----------------------------------------------------------------------------

.PHONY: build up deploy help Makefile

# -----------------------------------------------------------------------------
# Documentation
# -----------------------------------------------------------------------------
# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
#SPHINXBUILD   ?= sphinx-build
SPHINXBUILD := $(VENV_DIR)/bin/sphinx-build
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

#.PHONY: help Makefile

serve-docs:
	uv run python -m http.server 5001 --directory _build/$(filter-out $@,$(MAKECMDGOALS))/

revealjs:
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

%:
	@:
