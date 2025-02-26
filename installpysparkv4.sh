#!/bin/bash

osascript -e 'tell application "Terminal"
    do script "yes | brew install openjdk@11 && \
              yes | brew install pyenv && \
              eval \"$(pyenv init --path)\" && \
              eval \"$(pyenv init -)\" && \
              eval \"$(pyenv virtualenv-init -)\" && \
              yes | pyenv install 3.11.5 && \
              yes | brew install pyenv-virtualenv && \
              pyenv virtualenv 3.11.5 devenv || echo \"Virtualenv already exists, skipping creation\" && \
              pyenv shell devenv && \
              yes | brew install python && \
              yes | pip install pyspark && \
              pyspark --version"
end tell'
