echo "Watching folder `pwd`"

watchmedo shell-command --recursive --patterns="*.xml" --command='src/tools/build.py' src/content
