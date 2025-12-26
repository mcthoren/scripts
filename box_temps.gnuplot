# vim: set syntax=gnuplot:
set xtics rotate by 30 offset -5.7, -2.2
set y2tics 
set link y2
set mytics
set key outside below
set xlabel "Time (UTC)" offset 0.0, -1.6;
set xdata time;
set xrange [:] noextend
set format x "%F\n%TZ"
set timefmt "%Y-%m-%dT%H:%M:%SZ"
set grid
# set term pngcairo size 2000, 800 font ",10"
set term svg size 1800, 800 font ",12" background '0xffffff'

set format y "%.1f"
set format y2 "%.1f"
set title "Raspberry Pi Temperatures for the Last \\~24 Hours"
set ylabel "Pi Temp (°C)"
set y2label "Pi Temp (°C)"

# x = rand(182)
# plot for [ f in fn ] '/box_temps/'.f.'_temp.48h' u 1:2 t f w lines lw 2 lc rgbcolor rand(0) * 16777215

fn = "atom blast brink burn crater cutie"
set output '/var/www/htdocs/darkdata.org/ghz/box_temps/pitemps0.svg'
plot for [ f in fn ] '/box_temps/'.f.'_temp.24_hours' u 1:2 t f w lines lw 2

fn = "doomy dot elf fizzy glow golly holly"
set output '/var/www/htdocs/darkdata.org/ghz/box_temps/pitemps1.svg'
plot for [ f in fn ] '/box_temps/'.f.'_temp.24_hours' u 1:2 t f w lines lw 2

fn = "infinity jazz keen linty mop null orbit"
set output '/var/www/htdocs/darkdata.org/ghz/box_temps/pitemps2.svg'
plot for [ f in fn ] '/box_temps/'.f.'_temp.24_hours' u 1:2 t f w lines lw 2

fn = "pepe pickles ragtime scooty scuttle spiffy squiggle"
set output '/var/www/htdocs/darkdata.org/ghz/box_temps/pitemps3.svg'
plot for [ f in fn ] '/box_temps/'.f.'_temp.24_hours' u 1:2 t f w lines lw 2

fn = "straylight tab teddy up wave xray zero"
set output '/var/www/htdocs/darkdata.org/ghz/box_temps/pitemps4.svg'
plot for [ f in fn ] '/box_temps/'.f.'_temp.24_hours' u 1:2 t f w lines lw 2
