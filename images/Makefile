all:: richards_0.png richards_i_v8.png richards_i_mozjs17.png richards_f.png
all:: deltablue_0.png deltablue_i_v8.png deltablue_i_mozjs17.png deltablue_f.png
all:: havlak_0.png havlak_i_v8.png havlak_i_mozjs17.png havlak_f.png havlak_ff.png
all:: prop_constructing_test.png prop_access_test.png

PLOTER=histogram.plt
COUNT=6
COUNT_W_OPT=8
DELIM_COUNT = 5

CROP_0=60
CROP_i=118
CROP_f=45

plot_ = gnuplot -e "fileName='$1'; histCount=$2; xMax=$3; maxDel=$4; countDel=$5; s='$7'; showLegend=$8;" ${PLOTER}; convert -rotate 90 -crop 700x500+$6+0 $1.png $1.png ;

plot = $(call plot_,$1,$2,$3,$4,$5,$6,Время работы (мкс),$7)
plot_ms = $(call plot_,$1,$2,$3,$4,$5,$6,Время работы (мс),$7)
plot_ops = $(call plot_,$1,$2,$3,$4,$5,$6,Количество операций в секунду,$7)

# gnuplot -e "fileName='richards_0'; histCount=" ${PLOTER}
# convert -rotate 90 richards_0.png richards_0.png

richards_0.png: richards_0.dat
	$(call plot,"$(basename $@)", ${COUNT}, 115000, 100000, ${DELIM_COUNT},${CROP_0}, 0)

richards_i_v8.png: richards_i_v8.dat
	$(call plot,"$(basename $@)", 3, 21000, 19000, ${DELIM_COUNT},${CROP_i}, 0)

richards_i_mozjs17.png: richards_i_mozjs17.dat
	$(call plot,"$(basename $@)", 3, 120000, 190000, ${DELIM_COUNT},${CROP_i}, 0)

richards_f.png: richards_f.dat
	$(call plot,"$(basename $@)", ${COUNT_W_OPT}, 115000, 100000, ${DELIM_COUNT},${CROP_f}, 1)


deltablue_0.png: deltablue_0.dat
	$(call plot,"$(basename $@)", ${COUNT}, 80000, 70000, ${DELIM_COUNT},${CROP_0}, 0)

deltablue_i_v8.png: deltablue_i_v8.dat
	$(call plot_ms,"$(basename $@)", 5, 1400, 1300, ${DELIM_COUNT},190, 0)

deltablue_i_mozjs17.png: deltablue_i_mozjs17.dat
	$(call plot,"$(basename $@)", 5, 570000, 500000, 4,190, 0)

deltablue_f.png: deltablue_f.dat
	$(call plot,"$(basename $@)", ${COUNT_W_OPT}, 80000, 70000, ${DELIM_COUNT},${CROP_f}, 1)


havlak_0.png: havlak_0.dat
	$(call plot_ms,"$(basename $@)", ${COUNT}, 105000, 100000, ${DELIM_COUNT},${CROP_0}, 0)

havlak_i_v8.png: havlak_i_v8.dat
	$(call plot_ms,"$(basename $@)", 4, 105000, 100000, ${DELIM_COUNT},${CROP_i}, 0)

havlak_i_mozjs17.png: havlak_i_mozjs17.dat
	$(call plot_ms,"$(basename $@)", 4, 105000, 100000, ${DELIM_COUNT},${CROP_i}, 0)

havlak_f.png: havlak_f.dat
	$(call plot_ms,"$(basename $@)", ${COUNT_W_OPT}, 105000, 100000, ${DELIM_COUNT},${CROP_f}, 1)

havlak_ff.png: havlak_ff.dat
	$(call plot_ms,"$(basename $@)", ${COUNT_W_OPT}, 105000, 100000, ${DELIM_COUNT},${CROP_f}, 1)



prop_constructing_test.png: prop_constructing_test.dat
	$(call plot_ops,"$(basename $@)", 2, 45000000, 40000000, ${DELIM_COUNT},90, 0)

prop_access_test.png: prop_access_test.dat
	$(call plot_ops,"$(basename $@)", 2, 220000000, 200000000, ${DELIM_COUNT},90, 0)

clean:
	rm *.png