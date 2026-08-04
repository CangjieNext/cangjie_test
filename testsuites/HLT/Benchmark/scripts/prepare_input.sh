#!/bin/bash
# Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


rm -r tmp/

export cjHeapSize=16GB
export JETVMPROP="-Xmx2G"
export BENCH_DIR=$PWD/../

# knucleotide
echo "prepare knucleotide..."
go run programs/fasta/fasta.go 25000000  > knucleotide-input25000000.txt
mkdir -p tmp/knucleotide/
cp knucleotide-input25000000.txt tmp/knucleotide/
# reverse-complement
echo "prepare reverse-complement..."
go run programs/fasta/fasta.go 100000000  > revcomp-input100000000.txt
mkdir -p tmp/revcomp/
cp revcomp-input100000000.txt tmp/revcomp/
# revcomp_single
echo "prepare revcomp_single"
mkdir -p tmp/revcomp_single/
cp revcomp-input100000000.txt tmp/revcomp_single/
# regexredux
echo "prepare regexredux..."
go run programs/fasta/fasta.go 5000000 > regexredux-input5000000.txt
mkdir -p tmp/regexredux/
cp regexredux-input5000000.txt tmp/regexredux/
# regexredux_single
echo "prepare regexredux_single..."
mkdir -p tmp/regexredux_single/
cp regexredux-input5000000.txt tmp/regexredux_single/
rm *-input*.txt
# compile gmp for swift pidigits.
bash dependence_codedb.sh -a -j 16
res=`realpath ./gmp-6.2.0/include/gmp.h`;sed -i "s|replace_me|${res}|" module.map
echo "prepare cj_compile&swift_compile"
cp programs/regexredux/regexredux.cj programs/regexredux/regexredux.cj_compile
cp programs/regexredux/regexredux.swift programs/regexredux/regexredux.swift_compile
cp programs/knucleotide/knucleotide.cj programs/knucleotide/knucleotide.cj_compile
cp programs/knucleotide/knucleotide.swift programs/knucleotide/knucleotide.swift_compile
cp programs/fannkuchredux/fannkuchredux.cj programs/fannkuchredux/fannkuchredux.cj_compile
cp programs/fannkuchredux/fannkuchredux.swift programs/fannkuchredux/fannkuchredux.swift_compile
cp programs/revcomp/revcomp.cj programs/revcomp/revcomp.cj_compile
cp programs/revcomp/revcomp.swift programs/revcomp/revcomp.swift_compile
cp programs/pidigits/pidigits.cj programs/pidigits/pidigits.cj_compile
cp programs/pidigits/pidigits.swift programs/pidigits/pidigits.swift_compile
cp programs/fasta/fasta.cj programs/fasta/fasta.cj_compile
cp programs/fasta/fasta.swift programs/fasta/fasta.swift_compile
cp programs/binarytrees/binarytrees.cj programs/binarytrees/binarytrees.cj_compile
cp programs/binarytrees/binarytrees.swift programs/binarytrees/binarytrees.swift_compile
cp programs/mandelbrot/mandelbrot.cj programs/mandelbrot/mandelbrot.cj_compile
cp programs/mandelbrot/mandelbrot.swift programs/mandelbrot/mandelbrot.swift_compile
cp programs/spectralnorm/spectralnorm.cj programs/spectralnorm/spectralnorm.cj_compile
cp programs/spectralnorm/spectralnorm.swift programs/spectralnorm/spectralnorm.swift_compile
cp programs/nbody/nbody.cj programs/nbody/nbody.cj_compile
cp programs/nbody/nbody.swift programs/nbody/nbody.swift_compile
