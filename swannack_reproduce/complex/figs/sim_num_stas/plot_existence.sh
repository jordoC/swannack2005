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


set xrange [0 : 65]
set yrange [-0.05 : 1.05]

# Function for generating error bars:
#   Calculation comes from Modern Mathematical Methods (1988), assumes a 
#   90% confidence interval. Other assumptions about the independence of 
#   the Monte Carlo runs are also assumed.
n(x)=0.8159*(x*(1-x)/50)**.5
GPFUN_n = "n(x)=0.8159*(x*(1-x)/50)**.5"

eb_300(x)=0.8159*(x*(1-x)/300)**.5
GPFUN_eb_300 = "eb_300 (x)=0.8159*(x*(1-x)/300)**.5"


set title "SUS group existence probability vs number of candidate users considered \n Orthogonality requirement set to 0.2"
set datafile separator ","
plot    "eps_0.2_gs2.csv"           using 1:2:(n($2))   with yerrorbars title "Group size = 2, Simulated complex, 90% Confidence Interval"      lc rgb '#0000ff' lw 2 ps 2 pt 9
replot  "eps_0.2_gs2_theor.csv"     using 1:2                           title "Group size = 2, Calculated complex"                              with linespoints linestyle 1
replot  "eps_0.2_gs2_real.csv"      using 1:2:(n($2))   with yerrorbars title   "Group size = 2, Simulated real, 90% Confidence Interval "      lc rgb '#0000ff' lw 2 ps 2 pt 8
replot  "eps_0.2_gs2_real_theor.csv"using 1:2                           title "Group size = 2, Calculated real"                                 with linespoints linestyle 2

replot  "eps_0.2_gs3.csv"           using 1:2:(n($2))   with yerrorbars title "Group size = 3, Simulated complex, 90% Confidence Interval"      lc rgb '#ff0000' lw 2 ps 2 pt 5
replot  "eps_0.2_gs3_theor.csv"     using 1:2                           title "Group size = 3, Calculated complex"                              with linespoints linestyle 4
replot  "eps_0.2_gs3_real.csv"      using 1:2:(n($2))   with yerrorbars title "Group size = 3, Simulated real, 90% Confidence Interval"         lc rgb '#ff0000' lw 2 ps 2 pt 4
replot  "eps_0.2_gs3_real_theor.csv" using 1:2                          title "Group size = 3, Calculated real"                                 with linespoints linestyle 5

replot  "eps_0.2_gs4.csv"           using 1:2:(n($2))   with yerrorbars title "Group size = 4, Simulated complex, 90% Confidence Interval"      lc rgb '#000000' lw 2 ps 2 pt 7
replot  "eps_0.2_gs4_theor.csv"     using 1:2                           title "Group size = 4, Calculated complex"                              with linespoints linestyle 7
replot  "eps_0.2_gs4_real.csv"      using 1:2:(n($2))   with yerrorbars title "Group size = 4, Simulated real, 90% Confidence Interval"         lc rgb '#000000' lw 2 ps 2 pt 6
replot  "eps_0.2_gs4_real_theor.csv"using 1:2                           title "Group size = 4, Calculated real"                                 with linespoints linestyle 6

#set key  font ",8" spacing 0 right top Left box 0
#set key out vert
set key top right
set key  font ",12" 
set ylabel "Probability of SUS group existence" font ",15"
set xlabel "Number of users considered" font ",15"
set grid

set term png size 1800, 1200
set size 1,1
set output "eps_0.2.png"

replot

set title "SUS group existence probability vs number of candidate users considered \n Orthogonality requirement set to 0.4"
set xrange [0 : 30]
set yrange [-0.05 : 1.05]

plot    "eps_0.4_gs2.csv"           using 1:2:(eb_300($2))   with yerrorbars title "Group size = 2, Simulated complex, 90% Confidence Interval"         lc rgb '#0000ff' lw 2 ps 2 pt 9
replot  "eps_0.4_gs2_theor.csv"     using 1:2                           title "Group size = 2, Calculated complex"                                 with linespoints linestyle 1
replot  "eps_0.4_gs2_real.csv"      using 1:2:(eb_300($2))   with yerrorbars title   "Group size = 2, Simulated real, 90% Confidence Interval "         lc rgb '#0000ff' lw 2 ps 2 pt 8
replot  "eps_0.4_gs2_real_theor.csv"using 1:2                           title "Group size = 2, Calculated real"                                    with linespoints linestyle 2
                                                                                                                                                   
replot  "eps_0.4_gs3.csv"           using 1:2:(eb_300($2))   with yerrorbars title "Group size = 3, Simulated complex, 90% Confidence Interval"         lc rgb '#ff0000' lw 2 ps 2 pt 5
replot  "eps_0.4_gs3_theor.csv"     using 1:2                           title "Group size = 3, Calculated complex"                                 with linespoints linestyle 4
replot  "eps_0.4_gs3_real.csv"      using 1:2:(eb_300($2))   with yerrorbars title "Group size = 3, Simulated real, 90% Confidence Interval"            lc rgb '#ff0000' lw 2 ps 2 pt 4
replot  "eps_0.4_gs3_real_theor.csv" using 1:2                          title "Group size = 3, Calculated real"                                    with linespoints linestyle 5
                                                                                                                                                   
replot  "eps_0.4_gs4.csv"           using 1:2:(eb_300($2))   with yerrorbars title "Group size = 4, Simulated complex, 90% Confidence Interval"         lc rgb '#000000' lw 2 ps 2 pt 7
replot  "eps_0.4_gs4_theor.csv"     using 1:2                           title "Group size = 4, Calculated complex"                                 with linespoints linestyle 7
replot  "eps_0.4_gs4_real.csv"      using 1:2:(eb_300($2))   with yerrorbars title "Group size = 4, Simulated real, 90% Confidence Interval"            lc rgb '#000000' lw 2 ps 2 pt 6
replot  "eps_0.4_gs4_real_theor.csv"using 1:2                           title "Group size = 4, Calculated real"                                    with linespoints linestyle 6

set key  font ",12" bottom right

set term png size 1800, 1200
set size 1,1
set output "eps_0.4.png"

replot
