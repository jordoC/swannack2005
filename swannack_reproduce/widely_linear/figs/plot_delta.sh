#!/usr/bin/gnuplot

set tics font "Helvetica,20"

set xrange [0 : .5]
set yrange [0 :1]

plot "delta.dat"  using 1:3 title "m = 2" lc rgb '#0060ad' lw 2 ps 2 pt 1
replot "delta.dat" using 1:5  title "m = 4" lc rgb '#dd181f' lw 2 ps 2 pt 2
replot "delta.dat" using 1:7  title "m = 6" lc rgb '#7ad52b' lw 2 ps 2 pt 3
replot "delta.dat" using 1:9  title "m = 8" lc rgb '#b33eb3' lw 2 ps 2 pt 4

set key  font ",15" spacing 6 left top Left box 0
set xlabel "theta/pi" font ",20"
set ylabel "delta_c" font ",20"
set grid

set term png 
set output "delta.png"

replot
