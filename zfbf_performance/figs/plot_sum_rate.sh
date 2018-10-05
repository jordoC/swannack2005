#!/usr/bin/gnuplot

##################################################################################################################
##################################################################################################################
##################################################################################################################
set xrange [0 : 2]
set yrange [-0.05 : 3]

set title "Shannon sum rate vs Orthogonality requirement  \n MRT beamforming assumed at transmitter, 95% confidence interval Monte Carlo simulation" font ",25"

set datafile separator ","

plot    "15_candidate_zfbf_gs2.csv"           using 1:2:3 with yerrorbars title "15 candidate linear orthogonality, group size = 2"        lc rgb '#0000ff' lw 2 ps 2 pt 9
#replot  "15_candidate_mrt_gs2_wl.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 2" lc rgb '#0000ff' lw 2 ps 2 pt 8
#replot  "15_candidate_mrt_gs3.csv"           using 1:2:3   with yerrorbars title "15 candidate linear orthogonality, group size = 3"        lc rgb '#ff0000' lw 2 ps 2 pt 5
#replot  "15_candidate_mrt_gs3_wl.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 3" lc rgb '#ff0000' lw 2 ps 2 pt 4
replot  "15_candidate_mrt_gs2.csv"           using 1:2:3 with yerrorbars   title "15 candidate linear orthogonality, group size = 4"        lc rgb '#000000' lw 2 ps 2 pt 7
#replot  "15_candidate_mrt_gs4_wl.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 4" lc rgb '#000000' lw 2 ps 2 pt 6
#set key  font ",8" spacing 0 right top Left box 0
#set key out vert
set key top right
set key  font ",20" 
set key spacing 3 
set ylabel "Shannon sum rate (bps/Hz)" font ",25"
set xlabel "Orthogonality requirement" font ",25"
set grid

set term png size 1800, 1200
set size 1,1
set output "15_candidate_mrt.png"

replot

