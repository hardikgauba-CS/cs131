#!/bin/bash

# Check if the directory exists, if not, create it
if [[ ! -d "United States" ]]; then
    mkdir "United States"
fi

# Define the CSV file path and categories
csvFile="Global YouTube Statistics.csv"
categories=("Music" "Entertainment" "Gaming" "Comedy")

# Loop through each category
for category in "${categories[@]}"
do
    # Use awk to filter and write to respective category file
    awk -F ',' -v cat="$category" '$5 == cat && $9 == "US" { print }' "$csvFile" > "United States/$category.txt"
done

