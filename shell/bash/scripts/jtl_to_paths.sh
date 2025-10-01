#!/bin/bash

# JMeter JTL URL Processor Script
# Usage: ./process_jtl.sh <input_jtl_file> <output_file> [sed_pattern]

# Check if correct number of arguments provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <input_jtl_file> <output_file> [sed_pattern]"
    echo "Example: $0 results.jtl processed_urls.txt 's/http:/https:/g'"
    exit 1
fi

INPUT_FILE="$1"
OUTPUT_FILE="$2"
SED_PATTERN="${3:-s/.*/&/}" # Default pattern does nothing if not provided

# Check if input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' does not exist."
    exit 1
fi

# Check if input file is readable
if [ ! -r "$INPUT_FILE" ]; then
    echo "Error: Cannot read input file '$INPUT_FILE'."
    exit 1
fi

# Create output directory if it doesn't exist
OUTPUT_DIR=$(dirname "$OUTPUT_FILE")
if [ ! -d "$OUTPUT_DIR" ]; then
    mkdir -p "$OUTPUT_DIR"
fi

echo "Processing JTL file: $INPUT_FILE"
echo "Output file: $OUTPUT_FILE"
echo "Sed pattern: $SED_PATTERN"
echo "---"

# Process the JTL file:
# 1. Skip the header line (if present)
# 2. Extract the URL field (14th column, 0-indexed as field 14)
# 3. Apply sed transformation
# 4. Write to output file

# Check if file has header by looking at first line
FIRST_LINE=$(head -n1 "$INPUT_FILE")
if [[ "$FIRST_LINE" == "timeStamp,elapsed,label"* ]]; then
    echo "Header detected, skipping first line..."
    SKIP_HEADER=1
else
    echo "No header detected, processing all lines..."
    SKIP_HEADER=0
fi

# Process the file
if [ $SKIP_HEADER -eq 1 ]; then
    # Skip header line, extract URLs (14th field), apply sed, write to output
    tail -n +2 "$INPUT_FILE" | cut -d',' -f14 | sed "$SED_PATTERN" > "$OUTPUT_FILE"
else
    # Process all lines
    cut -d',' -f14 "$INPUT_FILE" | sed "$SED_PATTERN" > "$OUTPUT_FILE"
fi

# Check if processing was successful
if [ $? -eq 0 ]; then
    LINE_COUNT=$(wc -l < "$OUTPUT_FILE")
    echo "Successfully processed $LINE_COUNT URLs"
    echo "Results written to: $OUTPUT_FILE"
    
    # Show first few lines as preview
    echo "---"
    echo "Preview of output (first 5 lines):"
    head -n5 "$OUTPUT_FILE"
    
    if [ $LINE_COUNT -gt 5 ]; then
        echo "..."
        echo "($((LINE_COUNT - 5)) more lines)"
    fi
else
    echo "Error: Processing failed"
    exit 1
fi