#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

for file in "$SCRIPT_DIR"/*.sql; do
    psql -f "${file}" > "${file%.sql}.txt"
done