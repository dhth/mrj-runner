#! /usr/bin/env bash

set -euo pipefail

if [ ! -f "output.json" ]; then
    echo "Error: output file not found" >&2
    exit 1
fi

prs_merged=$(jq -r '.run.summary.num_merged' output.json)
prs_disqualified=$(jq -r '.run.summary.num_disqualifications' output.json)
errors_encountered=$(jq -r '.run.summary.num_errors' output.json)

if [ "$prs_merged" = "0" ] && [ "$prs_disqualified" = "0" ] && [ "$errors_encountered" = "0" ]; then
    echo -n "0"
else
    echo -n "1"
fi
