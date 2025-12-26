# File: guessinggame.sh
#!/usr/bin/env bash

# guessinggame.sh
# Continuously ask the user to guess the number of files in the current directory
# until they guess correctly. Provides hints ("too low" / "too high").
# Contains: a function, a loop, and if/elif/else checks.

get_file_count() {
  # Count entries in the current directory (one per line).
  # Using ls -1 counts visible files and directories (not hidden).
  ls -1 | wc -l
}

print_prompt() {
  echo -n "How many files are in the current directory? "
}

# Determine the current number of files (evaluated once at start).
file_count=$(get_file_count)

# Main guessing loop
while true
do
  print_prompt
  read guess

  # Validate numeric input
  if ! [[ $guess =~ ^[0-9]+$ ]]; then
    echo "Please enter a non-negative integer."
    continue
  fi

  if [[ $guess -lt $file_count ]]; then
    echo "Too low! Try again."
  elif [[ $guess -gt $file_count ]]; then
    echo "Too high! Try again."
  else
    echo "🎉 Congratulations — you guessed correctly! There are $file_count files."
    break
  fi
done
