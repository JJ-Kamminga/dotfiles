#!/bin/bash

# JTL Performance Analyzer
# Usage: ./analyze_performance.sh <file.jtl>

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file.jtl>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found"
    exit 1
fi

echo "Performance Analysis for: $1"
echo "========================================"

awk -F',' '
NR>1 {
    elapsed[NR-1] = $2
    timestamp[NR-1] = $1
    total += $2
    count++
    if (min == "" || $2 < min) min = $2
    if ($2 > max) max = $2
}
END {
    # Sort elapsed times
    n = asort(elapsed)
    
    # Calculate average
    avg = total / count
    
    # Calculate percentiles
    p90_idx = int(n * 0.90)
    p95_idx = int(n * 0.95)
    p99_idx = int(n * 0.99)
    
    p90 = elapsed[p90_idx]
    p95 = elapsed[p95_idx]
    p99 = elapsed[p99_idx]
    
    # Calculate throughput (requests per second)
    # Find time range
    asort(timestamp, sorted_ts)
    duration = (sorted_ts[count] - sorted_ts[1]) / 1000
    throughput = count / duration
    
    printf "Average:        %.2f ms\n", avg
    printf "90%% line:       %.2f ms\n", p90
    printf "95%% line:       %.2f ms\n", p95
    printf "99%% line:       %.2f ms\n", p99
    printf "Min:            %.2f ms\n", min
    printf "Max:            %.2f ms\n", max
    printf "Throughput:     %.2f req/sec\n", throughput
    printf "Total requests: %d\n", count
    printf "Duration:       %.2f sec\n", duration
}
' "$1"

echo "========================================"