#/bin/sh

bat0_dir=/sys/class/power_supply/BAT0
bat1_dir=/sys/class/power_supply/BAT1

read -r cap0 < "$bat0_dir/capacity"
read -r cap1 < "$bat1_dir/capacity"

total_cap="$(($((cap0 + cap1)) / 2))"

echo "$total_cap%"
