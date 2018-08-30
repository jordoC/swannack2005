#!/usr/bin/gnuplot

##################################################################################################################
##################################################################################################################
##################################################################################################################
set xrange [0 : 2]
set yrange [-0.05 : 3]

set title "Shannon sum rate vs Orthogonality requirement  \n MRT beamforming assumed at transmitter, 95% confidence interval Monte Carlo simulation" font ",25"

set datafile separator ","

plot    "15_candidate_mrt_gs2.csv"           using 1:2:3   with yerrorbars title "15 candidate linear orthogonality, group size = 2"        lc rgb '#0000ff' lw 2 ps 2 pt 9
replot  "15_candidate_mrt_gs2_wl.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 2" lc rgb '#0000ff' lw 2 ps 2 pt 8
replot  "15_candidate_mrt_gs3.csv"           using 1:2:3   with yerrorbars title "15 candidate linear orthogonality, group size = 3"        lc rgb '#ff0000' lw 2 ps 2 pt 5
replot  "15_candidate_mrt_gs3_wl.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 3" lc rgb '#ff0000' lw 2 ps 2 pt 4
replot  "15_candidate_mrt_gs4.csv"           using 1:2:3   with yerrorbars title "15 candidate linear orthogonality, group size = 4"        lc rgb '#000000' lw 2 ps 2 pt 7
replot  "15_candidate_mrt_gs4_wl.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 4" lc rgb '#000000' lw 2 ps 2 pt 6
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

##################################################################################################################
##################################################################################################################
##################################################################################################################
set xrange [0 : 2]
set yrange [-0.05 : 3]

set title "Shannon sum rate vs Orthogonality requirement  \n MRT beamforming assumed at transmitter, 95% confidence interval Monte Carlo simulation"  font ",25"

set datafile separator ","

plot    "30_candidate_mrt_gs2.csv"           using 1:2:3   with yerrorbars title "30 candidate linear orthogonality, group size = 2"        lc rgb '#0000ff' lw 2 ps 2 pt 9
replot  "30_candidate_mrt_gs3.csv"           using 1:2:3   with yerrorbars title "30 candidate linear orthogonality, group size = 3"        lc rgb '#ff0000' lw 2 ps 2 pt 5
replot  "30_candidate_mrt_gs4.csv"           using 1:2:3   with yerrorbars title "30 candidate linear orthogonality, group size = 4"        lc rgb '#000000' lw 2 ps 2 pt 7
#set key  font ",8" spacing 0 right top Left box 0
#set key out vert
set key bottom right
set key  font ",20" 
set key spacing 3 
set ylabel "Shannon sum rate (bps/Hz)" font ",25"
set xlabel "Orthogonality requirement" font ",25"
set grid

set term png size 1800, 1200
set size 1,1
set output "30_candidate_mrt.png"

replot

##################################################################################################################
##################################################################################################################
##################################################################################################################
set xrange [-0.01 : 0.1]
set yrange [8: 30]

set title "Shannon sum rate vs Orthogonality requirement  \n MRT beamforming assumed at transmitter \n 90% confidence interval Monte Carlo simulation"

set datafile separator ","

##################################################################################################################
plot    "15_candidate_mrt_gs2_wl_zoom.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 2" lc rgb '#0000ff' lw 2 ps 2 pt 8
replot  "15_candidate_mrt_gs3_wl_zoom.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 3" lc rgb '#ff0000' lw 2 ps 2 pt 4
replot  "15_candidate_mrt_gs4_wl_zoom.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 4" lc rgb '#000000' lw 2 ps 2 pt 6
#set key  font ",8" spacing 0 right top Left box 0
#set key out vert
##################################################################################################################
set key top right
set key  font ",12" 
set ylabel "Shannon sum rate (bps/Hz)" font ",15"
set xlabel "Orthogonality requirement" font ",15"
set grid
##################################################################################################################

set term png size 1800, 1200
set size 1,1
set output "15_candidate_mrt_zoom.png"

replot

##################################################################################################################
##################################################################################################################
##################################################################################################################
set xrange [-0.01 : 0.1]
set yrange [2: 18]

set title "Shannon sum rate vs Orthogonality requirement  \n MRT beamforming assumed at transmitter \n 90% confidence interval Monte Carlo simulation"

set datafile separator ","

##################################################################################################################
plot    "10_candidate_mrt_gs2_wl_zoom.csv"        using 1:2:3   with yerrorbars title "10 candidate widely linear orthogonality, group size = 2" lc rgb '#0000ff' lw 2 ps 2 pt 8
replot  "10_candidate_mrt_gs3_wl_zoom.csv"        using 1:2:3   with yerrorbars title "10 candidate widely linear orthogonality, group size = 3" lc rgb '#ff0000' lw 2 ps 2 pt 4
replot  "10_candidate_mrt_gs4_wl_zoom.csv"        using 1:2:3   with yerrorbars title "10 candidate widely linear orthogonality, group size = 4" lc rgb '#000000' lw 2 ps 2 pt 6
#set key  font ",8" spacing 0 right top Left box 0
#set key out vert
##################################################################################################################
set key top right
set key  font ",12" 
set ylabel "Shannon sum rate (bps/Hz)" font ",15"
set xlabel "Orthogonality requirement" font ",15"
set grid
##################################################################################################################

set term png size 1800, 1200
set size 1,1
set output "10_candidate_mrt_zoom.png"

replot
##################################################################################################################
##################################################################################################################
##################################################################################################################
set xrange [-0.01 : 0.1]
set yrange [-.1: 6]

set title "Shannon sum rate vs Orthogonality requirement  \n MRT beamforming assumed at transmitter \n 90% confidence interval Monte Carlo simulation"

set datafile separator ","

##################################################################################################################
plot    "5_candidate_mrt_gs2_wl_zoom.csv"        using 1:2:3   with yerrorbars title "5 candidate widely linear orthogonality, group size = 2" lc rgb '#0000ff' lw 2 ps 2 pt 8
replot  "5_candidate_mrt_gs3_wl_zoom.csv"        using 1:2:3   with yerrorbars title "5 candidate widely linear orthogonality, group size = 3" lc rgb '#ff0000' lw 2 ps 2 pt 4
replot  "5_candidate_mrt_gs4_wl_zoom.csv"        using 1:2:3   with yerrorbars title "5 candidate widely linear orthogonality, group size = 4" lc rgb '#000000' lw 2 ps 2 pt 6
#set key  font ",8" spacing 0 right top Left box 0
#set key out vert
##################################################################################################################
set key top right
set key  font ",12" 
set ylabel "Shannon sum rate (bps/Hz)" font ",15"
set xlabel "Orthogonality requirement" font ",15"
set grid
##################################################################################################################

set term png size 1800, 1200
set size 1,1
set output "5_candidate_mrt_zoom.png"

replot
