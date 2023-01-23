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

function check() {
	file_args=()
	for file in ${@:3}
	do
		arg="$file "
		file_args+=( $arg )
	done
	mix format --check-formatted ${file_args[@]}
}

function format() {
	file_args=()
	for file in ${@:3}
	do
		arg="$file "
		file_args+=( $arg )
	done
	mix format ${file_args[@]}
}

command=$1

case $command in
	credo)
		echo "Running credo"
		credo $@
		;;

	check)
		echo "Checking formatting"
		check $@
		;;

	format)
		echo "Formatting"
		format $@
		;;

	*)
		echo "Running $command"
		format $@
		;;
esac
