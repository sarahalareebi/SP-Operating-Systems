
#!/bin/bash

# Feature 1 - Praise
# Text Input and Basic Counting

# Allow the user to enter text
enter_text() {
    echo "Enter your text:"
    read -r text
    echo "$text" > input.txt
    echo "Text saved successfully."
}

# Allow the user to load a text file
load_file() {
    echo "Enter the filename:"
    read -r filename

    if [ -f "$filename" ]; then
        cp "$filename" input.txt
        echo "File loaded successfully."
    else
        echo "File not found."
    fi
}

# Count words
count_words() {
    echo "Number of words:"
    wc -w < input.txt
}

# Count characters
count_characters() {
    echo "Number of characters:"
    wc -m < input.txt
}

# Count lines
count_lines() {
    echo "Number of lines:"
    wc -l < input.txt
}
