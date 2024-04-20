#!/usr/bin/env bash

set -e

if [ -z ${PYTHON+x} ]; then
	PYTHON="/usr/bin/env python"
fi

echo "Using python \"$PYTHON\""

if ! [ -d venv ]; then
	echo "Creating virtual environment"
	$PYTHON -m venv venv
	source venv/bin/activate
	pip install -r requirements.txt
fi

if [[ -z "$VIRTUAL_ENV" ]]; then
	echo "Entering virtual environment"
	source venv/bin/activate
fi

echo "Generating glad"
$PYTHON -m glad "$@"
