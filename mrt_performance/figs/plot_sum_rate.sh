#!/usr/bin/gnuplot
                
set tics font "Helvetica,10"

set style line 1 \
    linecolor rgb '#0000ff' \
    linetype 1 linewidth 2 \
    pointtype 9 pointsize 1.5

set style line 2 \
    linecolor rgb '#0000ff' \
    linetype 1 linewidth 2 \
    pointtype 8 pointsize 1.5

set style line 3 \
    linecolor rgb '#ff0000' \
    linetype 1 linewidth 2 \
    pointtype 3 pointsize 1.5

set style line 4 \
    linecolor rgb '#ff0000' \
    linetype 1 linewidth 2 \
    pointtype 5 pointsize 1.5

set style line 5 \
    linecolor rgb '#ff0000' \
    linetype 1 linewidth 2 \
    pointtype 4 pointsize 1.5

set style line 6 \
    linecolor rgb '#000000' \
    linetype 1 linewidth 2 \
    pointtype 6 pointsize 1.5

set style line 7 \
    linecolor rgb '#000000' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5


set xrange [0 : 2]
set yrange [-0.05 : 8]

# Function for generating error bars:
#   Calculation comes from Modern Mathematical Methods (1988), assumes a 
#   90% confidence interval. Other assumptions about the independence of 
#   the Monte Carlo runs are also assumed.
n(x)=0.8159*(x*(1-x)/50)**.5
GPFUN_n = "n(x)=0.8159*(x*(1-x)/50)**.5"

eb_300(x)=0.8159*(x*(1-x)/300)**.5
GPFUN_eb_300 = "eb_300 (x)=0.8159*(x*(1-x)/300)**.5"


set title "Shannon sum rate vs Orthogonality requirement  \n MRT beamforming assumed at transmitter \n 90% confidence interval Monte Carlo simulation"
set datafile separator ","
plot    "15_candidate_mrt_gs2.csv"           using 1:2:3   with yerrorbars title "15 candidate linear orthogonality, group size = 2"        lc rgb '#0000ff' lw 2 ps 2 pt 9
replot  "15_candidate_mrt_gs2_wl.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 2" lc rgb '#0000ff' lw 2 ps 2 pt 8
replot  "15_candidate_mrt_gs3.csv"           using 1:2:3   with yerrorbars title "15 candidate linear orthogonality, group size = 3"        lc rgb '#ff0000' lw 2 ps 2 pt 5
replot  "15_candidate_mrt_gs2_wl.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 3" lc rgb '#ff0000' lw 2 ps 2 pt 4
replot  "15_candidate_mrt_gs4.csv"           using 1:2:3   with yerrorbars title "15 candidate linear orthogonality, group size = 4"        lc rgb '#000000' lw 2 ps 2 pt 7
replot  "15_candidate_mrt_gs2_wl.csv"        using 1:2:3   with yerrorbars title "15 candidate widely linear orthogonality, group size = 4" lc rgb '#000000' lw 2 ps 2 pt 6
#set key  font ",8" spacing 0 right top Left box 0
#set key out vert
set key top right
set key  font ",12" 
set ylabel "Shannon sum rate (bps/Hz)" font ",15"
set xlabel "Orthogonality requirement" font ",15"
set grid

set term png size 1800, 1200
set size 1,1
set output "15_candidate_mrt_linear.png"

replot

