all: build_hist build_hist2

build_hist: hist
	gnuplot hist
	convert -rotate 90 histograms.2.png histograms.2.png

build_hist2: hist2
	gnuplot hist2
