#!/bin/bash

usage() {
    echo "Usage: $0 -i <input_file> [-d data_loc] [-c code_loc] [-h]"
    echo "  -i: Input C source file"
    echo "  -d: Data location value (default: 0x3979)"
    echo "  -c: Code location value (default: 0x0)"
    echo "  -h: Display help and exit"
}

# Default values for data_loc and code_loc
data_loc="0x3979"
code_loc="0x0"

# Parse command line options
while getopts "i:d:c:h" opt; do
    case $opt in
        i)
            input_file="$OPTARG"
            ;;
        d)
            data_loc="$OPTARG"
            ;;
        c)
            code_loc="$OPTARG"
            ;;
        h)
            usage
            exit 0
            ;;
        \?)
            usage
            exit 1
            ;;
    esac
done

# Check if the input file was provided
if [ -z "$input_file" ]; then
    echo "Error: Input file is required"
    usage
    exit 1
fi
file_loc="${input_file%.*}"
input_file_no_ext=$(basename "$input_file" .c)
output_dir="$(dirname "$input_file")"

original_dir=$(pwd)

cd "$output_dir"

# Execute the commands with the specified values
sdcc --data-loc "$data_loc" --code-loc "$code_loc" --no-std-crt0 -mz80 "$input_file_no_ext.c"
makebin -s 40000 "${input_file_no_ext}.ihx" "${input_file_no_ext}.bin"
xxd -ps -c 1 "${input_file_no_ext}.bin" > "${input_file_no_ext}.hex"

cd "$original_dir"

# Create the roms directory if it doesn't exist
mkdir -p roms

# Move the output files to the roms directory
mv "${file_loc}.hex" roms/rom.hex

echo "Output files have been saved to the roms directory."