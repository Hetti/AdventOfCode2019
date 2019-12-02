#!/bin/bash

FILE=$1

solution=0
div=3
minus=2

while read LINE; do
  fuel=$((LINE/div))
  fuel=$((fuel-minus))
  solution=$((solution+fuel))

  while (($fuel > 0)); do
    fuel=$((fuel/div))
    if (( $fuel >= 2 )); then
      fuel=$((fuel-minus))
      solution=$((solution+fuel))
    fi
  done

done < $FILE

echo $solution
