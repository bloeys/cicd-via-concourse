#!/bin/sh

echo "Hello!\nThis is running from a script.\n"
echo "Printing 1 to 10"

for x in $(seq 1 10);
do
  echo "$x"
done

echo "Finished printing!"