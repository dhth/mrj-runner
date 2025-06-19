#! /usr/bin/env bash

set -euo pipefail

if [ ! -f "summary.txt" ]; then
    echo "Error: summary file not found" >&2
    exit 1
fi

prs_merged=$(grep 'PRs merged' summary.txt | cut -d: -f2 | xargs || echo 0)
prs_disqualified=$(grep 'PRs disqualified' summary.txt | cut -d: -f2 | xargs || echo 0)
errors_encountered=$(grep 'Errors encountered' summary.txt | cut -d: -f2 | xargs || echo 0)

if [ "$prs_merged" = "0" ] && [ "$prs_disqualified" = "0" ] && [ "$errors_encountered" = "0" ]; then
    echo -n "0"
else
    echo -n "1"
fi
