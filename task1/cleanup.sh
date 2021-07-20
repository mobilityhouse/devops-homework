#!/bin/bash

NUMLINES=20000
MEGABYTE=$((1024*1024*1024))

find /opt -name '.prune-enable' | while read -r file; do
	dir=$(dirname $file)
	if [ -e $dir/crash.dump ]; then
		rm $dir/crash.dump
	fi
	for i in $(ls $dir/*.log 2>/dev/null); do
		if [ $(stat -c %s $i) -gt $MEGABYTE ]; then
			if [ $(wc -l $i) -gt $NUMLINES ]; then
				mv $i ${i}.tmp
				tail -$NUMLINES ${i}.tmp > $i
				rm ${i}.tmp
			fi
		fi
	done
done
