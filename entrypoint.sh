#!/bin/bash
# set -o xtrace


file_args=()
for file in $@
do
	arg="--files-included $file"
	file_args+=( $arg )
done

mix credo ${file_args[@]} --config-file /src/.credo.exs --strict
