# vim: set syntax=gnuplot:
set xtics rotate by 30 offset -5.7, -2.2
set y2tics 
set mytics
set key outside below
set xlabel "Time (UTC)" offset 0.0, -1.6;
set xdata time;
set xrange [:] noextend
set format x "%F\n%TZ"
set timefmt "%Y-%m-%dT%H:%M:%SZ"
set grid
set term pngcairo size 2000, 800 font ",10"

set format y "%.1f"
set format y2 "%.1f"
set title "Raspberry Pi Temperatures for the Last \\~24 Hours"
set ylabel "Pi Temp (°C)"
set y2label "Pi Temp (°C)"

# x = rand(182)
# plot for [ f in fn ] '/box_temps/'.f.'_temp.48h' u 1:2 t f w lines lw 2 lc rgbcolor rand(0) * 16777215

fn = "atom blast brink burn crater cutie doomy"
set output '/var/www/htdocs/darkdata.org/ghz/box_temps/pitemps0.png'
plot for [ f in fn ] '/box_temps/'.f.'_temp.24h' u 1:2 t f w lines lw 2

fn = "dot elf fizzy glow golly holly infinity"
set output '/var/www/htdocs/darkdata.org/ghz/box_temps/pitemps1.png'
plot for [ f in fn ] '/box_temps/'.f.'_temp.24h' u 1:2 t f w lines lw 2

fn = "keen linty pepe pickles scooty scuttle spiffy"
set output '/var/www/htdocs/darkdata.org/ghz/box_temps/pitemps2.png'
plot for [ f in fn ] '/box_temps/'.f.'_temp.24h' u 1:2 t f w lines lw 2

fn = "squiggle straylight tab teddy up wave zero"
set output '/var/www/htdocs/darkdata.org/ghz/box_temps/pitemps3.png'
plot for [ f in fn ] '/box_temps/'.f.'_temp.24h' u 1:2 t f w lines lw 2
