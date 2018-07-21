#!/usr/bin/gnuplot

set tics font "Helvetica,20"

set xrange [.15 : 1]
set yrange [0 : 70]

plot "existence.dat"  using 1:2 title "Group size = 2" lc rgb '#0060ad' lw 2 ps 2 pt 1
replot "existence.dat" using 1:3  title "Group size = 3" lc rgb '#dd181f' lw 2 ps 2 pt 2
replot "existence.dat" using 1:4  title "Group size = 4" lc rgb '#7ad52b' lw 2 ps 2 pt 3

set key  font ",15" spacing 6 left top Left box 0
set xlabel "theta_{epsilon,rho^+}" font ",20"
set ylabel "Number of users, n" font ",20"
set grid

set term png 
set output "existence.png"

replot
