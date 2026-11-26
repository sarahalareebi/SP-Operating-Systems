#!/bin/bash

# Feature 2 - Sarah Al-Areebi
# Advanced Word Analysis

echo "Word and Character Counter"

echo "Enter the file name:"
read -r filename

# Check if the file exists
if [ ! -f "$filename" ]; then
    echo "File not found."
    exit 1
fi

# Character counter
characters=$(wc -m < "$filename")
echo "Number of characters: $characters"

# Unique word counter
count_unique_words() {
    echo "Number of unique words:"

    tr -cs '[:alpha:]' '\n' < "$filename" |
        tr '[:upper:]' '[:lower:]' |
        sort -u |
        grep -c .
}

# Most common words
word_frequency() {
    echo "Most common words:"

    tr -cs '[:alpha:]' '\n' < "$filename" |
        tr '[:upper:]' '[:lower:]' |
        grep '.' |
        sort |
        uniq -c |
        sort -nr |
        head -5
}

# Longest word
longest_word() {
    echo "Longest word:"

    tr -cs '[:alpha:]' '\n' < "$filename" |
        awk 'length($0) > max {
            max = length($0)
            word = $0
        }
        END {print word}'
}

# Shortest word
shortest_word() {
    echo "Shortest word:"

    tr -cs '[:alpha:]' '\n' < "$filename" |
        awk 'length($0) > 0 && (min == 0 || length($0) < min) {
            min = length($0)
            word = $0
        }
        END {print word}'
}

# Average word length
average_word_length() {
    echo "Average word length:"

    tr -cs '[:alpha:]' '\n' < "$filename" |
        awk 'length($0) > 0 {
            total += length($0)
            count++
        }
        END {
            if (count > 0)
                printf "%.2f\n", total / count
            else
                print "0"
        }'
}

# Call functions
count_unique_words
word_frequency
longest_word
shortest_word
average_word_length