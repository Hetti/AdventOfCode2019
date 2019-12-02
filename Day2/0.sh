#!/bin/bash

FILE=$1

declare -a solution
add=1
mult=2
finished=99
step=4
currentindex=0

#fill array
while IFS=, read -ra data; do
  for num in "${data[@]}"; do
    solution+=($num)
  done
done < $FILE

while ((${solution[$currentindex]} != $finished)); do
  
  case ${solution[$currentindex]} in

  $add)
    add1=${solution[${solution[$((currentindex+1))]}]}
    add2=${solution[${solution[$((currentindex+2))]}]}
    solution[${solution[$((currentindex+3))]}]=$((add1+add2))
    ;;

  $mult)
    mul1=${solution[${solution[$((currentindex+1))]}]}
    mul2=${solution[${solution[$((currentindex+2))]}]}
    solution[${solution[$((currentindex+3))]}]=$((mul1*mul2))
    # Thats how it would look like as a oneliner
    #solution[${solution[$((currentindex+3))]}]=$((${solution[${solution[$((currentindex+1))]}]}*${solution[${solution[$((currentindex+2))]}]}))
    ;;
    
  *)
    #do nothing
    ;;
  esac

  #get next instruction  
  currentindex=$((currentindex+step))
done

echo "${solution[0]}"


