#!/bin/bash


# Set the IFS to ,
IFS=,

# Set the string to split
string=$(curl -s ipinfo.io | jq '.loc')

# Split the string into an array called "array"
read -ra array <<< "$string"

# Print the array
echo ${array[@]} | sed 's/\"//g' > geolocation
