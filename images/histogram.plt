reset
set terminal pngcairo enhanced font "arial,12" size 500, 700 transparent # fontscale 1.0

# fileName = 'richards_0.dat'
# histCount = 10
# xMax = 120000
# maxDel = 100000
# countDel = 5
stepDel = maxDel / countDel
# s = "мкс"

set output sprintf("%s.png", fileName)

set style data histogram
set style histogram cluster gap 1
set style fill solid border -1
# set boxwidth 0.8

set xtics rotate by 90 scale 0 offset 0, -9
# set xtics right
unset ytics
unset key;
if (showLegend!=0) set key left vertical samplen 1;
set y2tics 0, stepDel, maxDel rotate by 90 offset 0, -1.5
set y2label sprintf('%s', s) offset -2.5
set format y2 "%10.0f"

set yrange [0:xMax]
set xrange [-0.5:(histCount + 0.7)]

Red = "#ff0000"; Green = "#00ff00"; Blue = "#0000ff"

datafile = sprintf("%s.dat", fileName)

set multiplot
plot datafile u 2:xticlabel(1) fc rgb Blue title ""
plot datafile u 3:xticlabel(1) fc rgb Green title " "
plot datafile u 4:xticlabel(1) fc rgb Red title "     "

if (showLegend!=0) \
	unset y2label; \
	set yrange [0:100]; \
	set xrange [0:10]; \
	unset key; \
	unset ytics; \
	unset xtics; \
	unset border; \
	set label "До оптимизаций" at 0.9,87 center rotate by 90; \
	set label "После оптимизаций" at 1.8,85 center rotate by 90; \
	plot 0; \