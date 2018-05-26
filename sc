#!/bin/sh

OS=$(uname)

[ $OS = "FreeBSD" ] && {
	apm -l; echo $(( $(apm -t) / 60))
}

[ $OS = "OpenBSD" ] && {
	apm -lm 
}
