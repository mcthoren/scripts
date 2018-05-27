#!/bin/sh

OS=$(uname)

[ $OS = "FreeBSD" ] && {
	sysctl hw.acpi.thermal.tz0.temperature
	apm -l; echo $(( $(apm -t) / 60))
	date
}

[ $OS = "OpenBSD" ] && {
	sysctl hw | egrep '0\.temp0|cpus|setp|acpibat|acpiac|fan0';
	apm -lm 
	date
}
