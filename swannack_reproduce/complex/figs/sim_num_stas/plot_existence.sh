#!/usr/bin/gnuplot
                
set tics font "Helvetica,10"

set style line 1 \
    linecolor rgb '#0000ff' \
    linetype 1 linewidth 2 \
    pointtype 9 pointsize 1.5

set style line 2 \
    linecolor rgb '#dd181f' \
    linetype 1 linewidth 2 \
    pointtype 2 pointsize 1.5

set style line 3 \
    linecolor rgb '#ff0000' \
    linetype 1 linewidth 2 \
    pointtype 3 pointsize 1.5

set style line 4 \
    linecolor rgb '#ff0000' \
    linetype 1 linewidth 2 \
    pointtype 5 pointsize 1.5

set style line 5 \
    linecolor rgb '#ff00ff' \
    linetype 1 linewidth 2 \
    pointtype 2 pointsize 1.5

set style line 7 \
    linecolor rgb '#000000' \
    linetype 1 linewidth 2 \
    pointtype 7 pointsize 1.5


set xrange [0 : 65]
set yrange [-0.05 : 1.05]

set title "SUS group existence probability vs number of candidate users considered \n Orthogonality requirement set to 0.2"
set datafile separator ","
plot    "eps_0.2_gs2.csv"       using 1:2 title "GS=2, Abs"  lc rgb '#0000ff' lw 2 ps 2 pt 9
replot  "eps_0.2_gs2_theor.csv" using 1:2 title "GS=2, Abs Calc" with linespoints linestyle 1
replot  "eps_0.2_gs2_real.csv"  using 1:2 title "GS=2, Real" lc rgb '#0000ff' lw 2 ps 2 pt 8

replot  "eps_0.2_gs3.csv"       using 1:2 title "GS=3, Abs"  lc rgb '#ff0000' lw 2 ps 2 pt 5
replot  "eps_0.2_gs3_theor.csv" using 1:2 title "GS=3, Abs Calc" with linespoints linestyle 4
replot  "eps_0.2_gs3_real.csv"  using 1:2 title "GS=3, Real" lc rgb '#ff0000' lw 2 ps 2 pt 4

replot  "eps_0.2_gs4.csv"       using 1:2 title "GS=4, Abs"  lc rgb '#000000' lw 2 ps 2 pt 7
replot  "eps_0.2_gs4_theor.csv" using 1:2 title "GS=4, Abs Calc" with linespoints linestyle 7
replot  "eps_0.2_gs4_real.csv"  using 1:2 title "GS=4, Real" lc rgb '#000000' lw 2 ps 2 pt 6

#set key  font ",8" spacing 0 right top Left box 0
set key  font ",8" right top 
set ylabel "Probability of SUS group existence" font ",15"
set xlabel "Number of users considered" font ",15"
set grid

set term png 
set output "eps_0.2.png"

replot

set title "SUS group existence probability vs number of candidate users considered \n Orthogonality requirement set to 0.4"
set xrange [0 : 30]
set yrange [-0.05 : 1.05]

plot    "eps_0.4_gs2.csv"       using 1:2 title "GS=2, Abs"  lc rgb '#0000ff' lw 2 ps 2 pt 9
replot  "eps_0.4_gs2_theor.csv" using 1:2 title "GS=2, Abs Calc" with linespoints linestyle 1
replot  "eps_0.4_gs2_real.csv"  using 1:2 title "GS=2, Real" lc rgb '#0000ff' lw 2 ps 2 pt 8

replot  "eps_0.4_gs3.csv"       using 1:2 title "GS=3, Abs"  lc rgb '#ff0000' lw 2 ps 2 pt 5
replot  "eps_0.4_gs3_theor.csv" using 1:2 title "GS=3, Abs Calc" with linespoints linestyle 4
replot  "eps_0.4_gs3_real.csv"  using 1:2 title "GS=3, Real" lc rgb '#ff0000' lw 2 ps 2 pt 4

replot  "eps_0.4_gs4.csv"       using 1:2 title "GS=4, Abs"  lc rgb '#000000' lw 2 ps 2 pt 7
replot  "eps_0.4_gs4_theor.csv" using 1:2 title "GS=4, Abs Calc" with linespoints linestyle 7
replot  "eps_0.4_gs4_real.csv"  using 1:2 title "GS=4, Real" lc rgb '#000000' lw 2 ps 2 pt 6

set key  font ",8" bottom right 

set output "eps_0.4.png"

replot
