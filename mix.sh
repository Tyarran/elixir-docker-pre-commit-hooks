#!/bin/bash
# set -o xtrace

function credo() {
	file_args=()
	for file in ${@:2}
	do
		arg="--files-included $file"
		file_args+=( $arg )
	done
	mix credo ${file_args[@]} --config-file /src/.credo.exs --strict
}

command=$1

case $command in
	credo)
		echo "Running credo"
		credo $@
		;;

	*)
		echo "Running mix $1"
		mix $@
		;;
esac
