#!/bin/bash





osascript -e 'tell application "Terminal"
    do script "pip install pyspark && pyspark --version"
    activate
end tell'
