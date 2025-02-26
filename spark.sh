#!/bin/bash

loggedInUser=$(stat -f%Su /dev/console)
set -e  # Exit immediately if any command exits with a non-zero status

# Function to run a command and wait for it to complete
run_cmd() {
  echo "Executing: $@"
  "$@"
}

echo "Step 1: Installing OpenJDK 11..."
run_cmd brew install openjdk@11

echo "Step 2: Installing pyenv..."
run_cmd brew install pyenv

echo "Step 3: Installing Python 3.11.5 using pyenv..."
run_cmd pyenv install 3.11.5

echo "Step 4: Installing pyenv-virtualenv..."
run_cmd brew install pyenv-virtualenv

echo "Step 5: Creating virtual environment 'devenv' with Python 3.11.5..."
run_cmd pyenv virtualenv 3.11.5 devenv

echo "Step 6: Activating virtual environment 'devenv'..."
run_cmd pyenv shell devenv

echo "Step 7: Re-activating virtual environment 'devenv'..."
run_cmd pyenv shell devenv

echo "Step 8: Installing Python via brew..."
run_cmd brew install python

echo "Step 9: Installing pyspark with pip..."
run_cmd pip install pyspark

echo "Step 10: Launching pyspark..."
run_cmd pyspark

echo "All steps completed."

/testing/
//