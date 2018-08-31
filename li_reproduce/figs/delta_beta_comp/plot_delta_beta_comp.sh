#!/usr/bin/gnuplot

##################################################################################################################
##################################################################################################################
##################################################################################################################
set xrange [0 : .5]
set yrange [-0.05 : 1.05]

set title "Fraction of 2N-hypersphere covered by cap vs. Colatitude angle of corresponding cap divided by pi" font ",25"

set datafile separator ","

plot    "delta_beta.csv"   using 1:2  title "Swannack's lower bound on delta_c, N = 4"  lc  rgb '#0000ff' lw 2 ps 2 pt 1
replot    "delta_beta.csv" using 1:3  title "Swannack's upper bound on delta_c, N = 4"  lc  rgb '#ff0000' lw 2 ps 2 pt 2
replot    "delta_beta.csv" using 1:4  title "Li's equality based on beta function, N = 4" lc rgb '#00ff00' lw 2 ps 2 pt 3
#set key  font ",8" spacing 0 right top Left box 0
#set key out vert
set key bottom right 
set key  font ",18" 
set key spacing 3 
set ylabel "Fraction of 2N-hypersphere covered by spherical cap" font ",25"
set xlabel "Colatitude angle of spherical cap divided by Pi" font ",25"
set grid

set term png size 1800, 1200
set size 1,1
set output "delta_beta.png"

replot

