#!/bin/sh
IMAGE=keopx/latex
exec docker run --rm -it -v "$PWD":/data "$IMAGE" "$@"
