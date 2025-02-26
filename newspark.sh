#!/bin/bash

loggedInUser=$(stat -f%Su /dev/console)

# Function to add user to sudoers temporarily
function add_sudoers_temp() {
    echo "$loggedInUser ALL=(ALL) NOPASSWD: ALL" | sudo tee /etc/sudoers.d/temp_brew_install
}

# Function to remove temporary sudoers entry
function remove_sudoers_temp() {
    sudo rm -f /etc/sudoers.d/temp_brew_install
}


# Grant write permissions to Homebrew installation directories
function grant_permissions() {
    if [[ $(arch) == "arm64" ]]; then
        # Apple Silicon
        sudo mkdir -p /opt/homebrew
        sudo chown -R "$loggedInUser":admin /opt/homebrew
        sudo chmod -R 777 /opt/homebrew
    else
        # Intel
        sudo mkdir -p /usr/local
        sudo chown -R "$loggedInUser":admin /usr/local
        sudo chmod -R 777 /usr/local
    fi
}


# Ensure the correct Homebrew path for the architecture
function configure_brew_path() {
    if [[ $(arch) == "arm64" ]]; then
        export PATH="/opt/homebrew/bin:$PATH"
    else
        export PATH="/usr/local/bin:$PATH"
    fi
}


# Add user to sudoers temporarily
add_sudoers_temp

# Grant permissions
grant_permissions

# Configure the correct Homebrew path
configure_brew_path



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



































# Remove user from sudoers
remove_sudoers_temp