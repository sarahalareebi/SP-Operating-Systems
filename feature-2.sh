#!/bin/bash

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
