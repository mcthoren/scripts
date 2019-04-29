#!/bin/sh

OS=$(uname)

[ $OS = "FreeBSD" ] && {
	sysctl dev.cpu.0.freq
	sysctl hw.acpi.thermal.tz0.temperature
	echo "Charge remaining: $(apm -l)%"
	echo "Estimatd run time: $(( $(apm -t) / 60)) min"
	date
}

[ $OS = "OpenBSD" ] && {
	sysctl hw | egrep '0\.temp0|cpus|setp|acpibat|acpiac|fan0';
	apm -lm 
	date
}
