#!/bin/bash

# JTL Status Code Analyzer
# Usage: ./analyze_jtl.sh <file.jtl>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file.jtl>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found"
    exit 1
fi

echo "Status Code Analysis for: $1"
echo "================================"

awk -F',' 'NR>1 {codes[$4]++; total++} END {for (code in codes) printf "%s: %d (%.2f%%)\n", code, codes[code], (codes[code]/total)*100}' "$1" | sort -t: -k2 -rn

echo "================================"
awk -F',' 'NR>1 {total++} END {printf "Total requests: %d\n", total}' "$1"