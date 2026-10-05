#!/bin/bash

echo "Character Counter"

echo "Enter the file name:"
read filename

characters=$(wc -m < "$filename")

echo "Number of characters: $characters"