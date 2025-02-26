#!/bin/bash

osascript -e 'tell application "Terminal"
    do script "yes | brew install openjdk@11 && yes | brew install pyenv && yes | pyenv install 3.11.5 && yes | brew install pyenv-virtualenv && pyenv virtualenv 3.11.5 devenv && pyenv shell devenv && pyenv shell devenv && yes | brew install python && yes | pip install pyspark && pyspark --version"
    activate
end tell'
