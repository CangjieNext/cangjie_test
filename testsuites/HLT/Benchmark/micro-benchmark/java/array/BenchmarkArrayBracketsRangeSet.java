/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package array;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.Arrays;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@Fork(1)
@State(Scope.Benchmark)
public class BenchmarkArrayBracketsRangeSet {
    static long[] arr_32 = new long[32];
    static long[] arr_256 = new long[256];
    static long[] arr_2048 = new long[2048];
    static long[] arr_65536 = new long[65536];
    static long[] arr_1048576 = new long[1048576];

    @Setup(Level.Invocation)
    public void setup() {
        Arrays.fill(arr_32, 0);
        Arrays.fill(arr_256, 0);
        Arrays.fill(arr_2048, 0);
        Arrays.fill(arr_65536, 0);
        Arrays.fill(arr_1048576, 0);
    }

    @Benchmark
    public void BenchmarkArrayBracketsRangeSetD1_N32() {
        Arrays.fill(arr_32, 0, 32, 1);
    }

    @Benchmark
    public void BenchmarkArrayBracketsRangeSetD1_N256() {
        Arrays.fill(arr_256, 0, 256, 1);
    }

    @Benchmark
    public void BenchmarkArrayBracketsRangeSetD1_N2048() {
        Arrays.fill(arr_2048, 0, 2048, 1);
    }

    @Benchmark
    public void BenchmarkArrayBracketsRangeSetD1_N65536() {
        Arrays.fill(arr_65536, 0, 65536, 1);
    }

    @Benchmark
    public void BenchmarkArrayBracketsRangeSetD1_N1048576() {
        Arrays.fill(arr_1048576, 0, 1048576, 1);
    }

    @Benchmark
    public void BenchmarkArrayBracketsRangeSetArrayD1_N32() {
        Arrays.fill(arr_32, 1);
    }

    @Benchmark
    public void BenchmarkArrayBracketsRangeSetArrayD1_N256() {
        Arrays.fill(arr_256, 1);
    }

    @Benchmark
    public void BenchmarkArrayBracketsRangeSetArrayD1_N2048() {
        Arrays.fill(arr_2048, 1);
    }

    @Benchmark
    public void BenchmarkArrayBracketsRangeSetArrayD1_N65536() {
        Arrays.fill(arr_65536, 1);
    }

    @Benchmark
    public void BenchmarkArrayBracketsRangeSetArrayD1_N1048576() {
        Arrays.fill(arr_1048576, 1);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayBracketsRangeSet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
