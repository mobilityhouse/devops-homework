#!/bin/bash

# Directories under /opt that contain the file names ".prune-enable"
find /opt -type f -name ".prune-enable" -print | xargs -n1 dirname | sort -u > prune_enable_folders.txt

# Delete crash.dump files from above list of folders
for folder in `cat prune_enable_folders.txt`
do
if [ -e $folder/crash.dump ]
echo "Deleting $folder/crash.dump"
rm -f $folder/crash.dump
fi

echo "Checking for *.log files > 1M size"

find /opt -name "*.log" -type f -size +1M > log_files.txt

# Replace the source file with last 20000 lines
for file in `cat log_files.txt`
do
tail -20000 $file > tmpfile
cat tmpfile > $file
rm -f tmpfile
done

# remove the file list at the end of loop
rm -f log_files.txt

done
