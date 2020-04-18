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

[ $OS = "Linux" ] && {
	upower -i /org/freedesktop/UPower/devices/battery_BAT0 | egrep 'percentage|battery$'
	upower -i /org/freedesktop/UPower/devices/line_power_AC | grep line

	# from the lm-sensors package
	sensors |egrep 'Core|temp1|fan1'
	date
}
