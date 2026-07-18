#!/usr/bin/env bash

set -Eeuo pipefail

readonly SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
cd "${SCRIPT_DIR}"

fail() {
  printf 'Error: %s\n' "$1" >&2
  exit 1
}

command -v docker >/dev/null 2>&1 || \
  fail 'Docker is not installed. Install Docker Engine or Docker Desktop first.'

docker compose version >/dev/null 2>&1 || \
  fail 'Docker Compose v2 is not available. Install the Docker Compose plugin first.'

docker info >/dev/null 2>&1 || \
  fail 'The Docker daemon is not running or the current user cannot access it.'

cleanup() {
  local status=$?
  trap - EXIT INT TERM
  docker compose down --remove-orphans >/dev/null 2>&1 || true
  exit "${status}"
}

trap cleanup EXIT INT TERM

docker compose up --build --remove-orphans
