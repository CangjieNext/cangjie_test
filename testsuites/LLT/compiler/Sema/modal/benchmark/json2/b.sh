cd "$(dirname "$0")"

if [[ ! -f ./main || p.cj -nt ./main ]]; then
cjc p.cj -lstdx.encoding.json -L$CANGJIE_STDX_PATH --import-path=$CANGJIE_STDX_PATH -g -Woff all -O2
fi
echo "running region on"
cjEnableLocalRegion=1 LD_LIBRARY_PATH=$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH /usr/bin/time -f'%e %M' ./main
mv log2.txt region.log

echo "running region off"
cjEnableLocalRegion=0 LD_LIBRARY_PATH=$CANGJIE_STDX_PATH:$LD_LIBRARY_PATH /usr/bin/time -f'%e %M' ./main
mv log2.txt no_region.log

awk '
FNR == 1 {
    sub(/^baseline=/, "")
    b = $1 + 0
    next
}
FNR == 2 {
    for (i = 1; i <= NF; i++) {
        printf "%d", $i - b
        if (i < NF) {
            printf " "
        }
    }
    print ""
}
' no_region.log region.log > region.data

# region.data: row 1 = no region (space-separated y values), row 2 = region.
gnuplot <<'EOF'
data = 'region.data'

set terminal pngcairo enhanced font "sans,11" size 1200, 600
set output 'region_lines.png'

set title 'region on vs region off'
set xlabel 'sample index'
set ylabel 'bytes'
set grid
set key top left

plot "< awk 'NR==1{for(i=1;i<=NF;i++) print i, \$i}' " . data with lines linewidth 2 title 'region off', \
     "< awk 'NR==2{for(i=1;i<=NF;i++) print i, \$i}' " . data with lines linewidth 2 title 'region on'

set output
EOF
