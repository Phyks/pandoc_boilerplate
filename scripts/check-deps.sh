#!/bin/sh

deps="pandoc-crossref pandoc-citeproc happy alex"
missing=""

print_list () {
	for l in $@; do
		echo " - $l"
	done
}

for dep in $deps; do
	if [ -z $(which $dep) ]; then
		missing="$missing $dep"
	fi
done

if [ "$missing" ]; then
	echo "The following dependencies haven't been found:"
	print_list $missing
	echo "Please run \`make install-deps\` or install them manually."
	echo
	exit 1
fi
