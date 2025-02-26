#!/bin/bash





osascript -e 'tell application "Terminal"
    do script "brew install openjdk@11 && brew install pyenv && pyenv install 3.11.5 && brew install pyenv-virtualenv && pyenv virtualenv 3.11.5 devenv  && pyenv shell devenv && pyenv shell devenv && brew install python && pip install pyspark && pyspark --version"
    activate
end tell'
