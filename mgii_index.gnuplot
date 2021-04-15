set title "Magnesium II Core-to-Wing Ratio"
set xtics rotate by 30 offset -5.7, -2.2
set ytics
set mytics
set y2tics
set key outside below
set xlabel "Time (UTC)" offset 0.0, -1.6
set xdata time;
set format x "%F\n%TZ"
set timefmt "%Y-%m-%dT%H:%M:%SZ"
set grid xtics
set grid y2tics
set term pngcairo size 1824, 984 font ",10"

set format y "%.4f"
set format y2 "%.4f"

dat_f='/tmp/mgii_index_last_40.dat'

set ylabel "MgII Index (ratio)"
set y2label "MgII Index (ratio)"
set output '/tmp/mgii_index.png'
plot dat_f using 1:2 title 'MgII Index' with lines lw 2 linecolor rgb "#dddd00"
