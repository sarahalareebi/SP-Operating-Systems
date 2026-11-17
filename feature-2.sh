#!/bin/bash

echo "Character Counter"

echo "Enter the file name:"
read filename

characters=$(wc -m < "$filename")

echo "Number of characters: $characters"
# Feature 2 - Sarah Al-Areebi
# Advanced Word Analysis

count_unique_words() {
    echo "Enter the filename:"
    read -r filename

    if [ ! -f "$filename" ]; then
        echo "File not found."
        return 1
    fi

    echo "Number of unique words:"
    tr -cs '[:alpha:]' '\n' < "$filename" |
        tr '[:upper:]' '[:lower:]' |
        sort -u |
        grep -c .
}

count_unique_words
