#!/bin/sh

ROOT=$(dirname $(readlink -f $0))

echo "Please add $ROOT/bin to your PATH"
echo "Please set HAXE_STD_PATH to $ROOT/std"

mkdir -p "$ROOT/releases"
mkdir -p "$ROOT/versions"

# Install fzf if needed
if ! [ -x "$(command -v fzf)" ]; then
	cd "$ROOT/bin"
	wget "https://github.com/junegunn/fzf-bin/releases/download/0.17.4/fzf-0.17.4-linux_amd64.tgz"
	tar -xf "fzf-0.17.4-linux_amd64.tgz"
	rm "fzf-0.17.4-linux_amd64.tgz"
	cd -
fi

if [ -z "$SKIP_DEFAULTS" ]; then
	# Download some versions
	PATH=$PATH:$ROOT/bin hx-download "3.4.7"
	PATH=$PATH:$ROOT/bin hx-download "4.0.0"
	PATH=$PATH:$ROOT/bin hx-download "4.0.3"
	PATH=$PATH:$ROOT/bin hx-download "latest"

	# Select default version
	PATH=$PATH:$ROOT/bin hx-select "4.0.3"
fi
