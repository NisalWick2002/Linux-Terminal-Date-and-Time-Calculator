#!/bin/bash

# Function to add days to a date
add_days() {
    local date=$1
    local days=$2
    local new_date=$(date -d "$date + $days days" +%Y-%m-%d)
    echo "Date after adding $days days: $new_date"
}

# Function to subtract days from a date
subtract_days() {
    local date=$1
    local days=$2
    local new_date=$(date -d "$date - $days days" +%Y-%m-%d)
    echo "Date after subtracting $days days: $new_date"
}

# Function to add hours to a date-time
add_hours() {
    local datetime=$1
    local hours=$2
    local new_datetime=$(date -d "$datetime + $hours hours" "+%Y-%m-%d %H:%M:%S")
    echo "Date-time after adding $hours hours: $new_datetime"
}

# Function to subtract hours from a date-time
subtract_hours() {
    local datetime=$1
    local hours=$2
    local new_datetime=$(date -d "$datetime - $hours hours" "+%Y-%m-%d %H:%M:%S")
    echo "Date-time after subtracting $hours hours: $new_datetime"
}

# Function to add minutes to a date-time
add_minutes() {
    local datetime=$1
    local minutes=$2
    local new_datetime=$(date -d "$datetime + $minutes minutes" "+%Y-%m-%d %H:%M:%S")
    echo "Date-time after adding $minutes minutes: $new_datetime"
}

# Function to subtract minutes from a date-time
subtract_minutes() {
    local datetime=$1
    local minutes=$2
    local new_datetime=$(date -d "$datetime - $minutes minutes" "+%Y-%m-%d %H:%M:%S")
    echo "Date-time after subtracting $minutes minutes: $new_datetime"
}

# Function to calculate difference in days between two dates
diff_days() {
    local date1=$1
    local date2=$2
    local diff=$(( ( $(date -d "$date2" +%s) - $(date -d "$date1" +%s) ) / 86400 ))
    echo "Difference between $date1 and $date2: $diff days"
}

# Function to calculate difference in hours between two date-times
diff_hours() {
    local datetime1=$1
    local datetime2=$2
    local diff=$(( ( $(date -d "$datetime2" +%s) - $(date -d "$datetime1" +%s) ) / 3600 ))
    echo "Difference between $datetime1 and $datetime2: $diff hours"
}

# Function to calculate difference in minutes between two date-times
diff_minutes() {
    local datetime1=$1
    local datetime2=$2
    local diff=$(( ( $(date -d "$datetime2" +%s) - $(date -d "$datetime1" +%s) ) / 60 ))
    echo "Difference between $datetime1 and $datetime2: $diff minutes"
}

# Menu to choose operation
echo "Choose an option:"
echo "1) Add days to a date"
echo "2) Subtract days from a date"
echo "3) Add hours to a date-time"
echo "4) Subtract hours from a date-time"
echo "5) Add minutes to a date-time"
echo "6) Subtract minutes from a date-time"
echo "7) Calculate difference in days between two dates"
echo "8) Calculate difference in hours between two date-times"
echo "9) Calculate difference in minutes between two date-times"
read -p "Option: " option

case $option in
    1)
        read -p "Enter date (YYYY-MM-DD): " date
        read -p "Enter number of days to add: " days
        add_days $date $days
        ;;
    2)
        read -p "Enter date (YYYY-MM-DD): " date
        read -p "Enter number of days to subtract: " days
        subtract_days $date $days
        ;;
    3)
        read -p "Enter date-time (YYYY-MM-DD HH:MM:SS): " datetime
        read -p "Enter number of hours to add: " hours
        add_hours "$datetime" $hours
        ;;
    4)
        read -p "Enter date-time (YYYY-MM-DD HH:MM:SS): " datetime
        read -p "Enter number of hours to subtract: " hours
        subtract_hours "$datetime" $hours
        ;;
    5)
        read -p "Enter date-time (YYYY-MM-DD HH:MM:SS): " datetime
        read -p "Enter number of minutes to add: " minutes
        add_minutes "$datetime" $minutes
        ;;
    6)
        read -p "Enter date-time (YYYY-MM-DD HH:MM:SS): " datetime
        read -p "Enter number of minutes to subtract: " minutes
        subtract_minutes "$datetime" $minutes
        ;;
    7)
        read -p "Enter the first date (YYYY-MM-DD): " date1
        read -p "Enter the second date (YYYY-MM-DD): " date2
        diff_days $date1 $date2
        ;;
    8)
        read -p "Enter the first date-time (YYYY-MM-DD HH:MM:SS): " datetime1
        read -p "Enter the second date-time (YYYY-MM-DD HH:MM:SS): " datetime2
        diff_hours "$datetime1" "$datetime2"
        ;;
    9)
        read -p "Enter the first date-time (YYYY-MM-DD HH:MM:SS): " datetime1
        read -p "Enter the second date-time (YYYY-MM-DD HH:MM:SS): " datetime2
        diff_minutes "$datetime1" "$datetime2"
        ;;
    *)
        echo "Invalid option"
        ;;
esac
