#!/bin/bash

case "$(uname -s)" in
Darwin)
	case "$(uname -m)" in
	x86_64)
		wget https://github.com/mvdan/sh/releases/download/v3.5.1/shfmt_v3.5.1_darwin_arm64
		mv shfmt_v3.5.1_darwin_arm64 shfmt
		;;
	arm64)
		wget https://github.com/mvdan/sh/releases/download/v3.5.1/shfmt_v3.5.1_darwin_amd64
		mv shfmt_v3.5.1_darwin_amd64 shfmt
		;;
	esac
	brew install shellcheck
	;;
Linux)
	wget https://github.com/mvdan/sh/releases/download/v3.5.1/shfmt_v3.5.1_linux_amd64
	mv shfmt_v3.5.1_linux_amd64 shfmt
	sudo apt install shellcheck
	;;
esac

chmod +x shfmt
