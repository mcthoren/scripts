#!/bin/sh
# vim: set syntax=sh:

OS="$(uname -s)"
HOST_N="$(hostname -s)"

MYHOME="/home/ghz"
[ "${OS}" = "Linux" ] && {
	[ -d "/import/home/ghz" ] && MYHOME="/import/home/ghz"
}

dst_d="${MYHOME}/box_temp"
dst_f="${dst_d}/${HOST_N}_temp.24h"

arch_d="${dst_d}/${HOST_N}/$(date -u +"%Y")"
arch_f="${arch_d}/${HOST_N}_temp.$(date -u +"%F")"

for tst_d in "${arch_d}" "${dst_d}"; do
	[ -d "${tst_d}" ] || mkdir -p "${tst_d}"
	[ -d "${tst_d}" ] || {
		echo "can't create ${tst_d}"
		exit 1
	}
done

[ "${OS}" = "OpenBSD" ] && temp="$(sysctl -n hw.sensors.bcmtmon0.temp0)"

[ "${OS}" = "Linux" ] && {
	temp=$(awk '{temp = ($1) / 1000; printf "%0.2f degC\n", temp}'  \
	/sys/class/thermal/thermal_zone0/temp)
}

dat_s="$(date -u +"%FT%TZ")\t${temp}\n"
printf "${dat_s}" >> "${dst_f}"
printf "${dat_s}" >> "${arch_f}"

# use our weather tools script to more better grab the last 24h of data
dat_f_24="${HOME}/box_temp/${HOST_N}/${HOST_N}_temp.24_hours"
"${HOME}/repos/weather_tools/grab_n_hours" -n 24 -d "${HOME}/box_temp/${HOST_N}" -f "${HOST_N}_temp"
[ -f "${dat_f_24}" ] && mv "${dat_f_24}" "${dst_d}/"
