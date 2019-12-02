#!/bin/bash

FILE=$1

solution=0
div=3
minus=2

while read LINE; do
  fuel=$((LINE/div))
  fuel=$((fuel-minus))
  solution=$((solution+fuel))
done < $FILE

echo $solution
