#!/bin/bash

# Feature 2 - Praise
# Word and Character Counter
# Additional Text Counting
# Count characters without spaces
count_without_spaces() {
    echo "Characters without whitespace:"
    tr -d '[:space:]' < input.txt | wc -m
}

# Count sentences
count_sentences() {
    echo "Number of sentences:"
    grep -o '[.!?]' input.txt | wc -l
}

# Count paragraphs
count_paragraphs() {
    echo "Number of paragraphs:"
    awk 'NF { if (!inside) count++; inside=1; next }
         { inside=0 }
         END { print count+0 }' input.txt
}
