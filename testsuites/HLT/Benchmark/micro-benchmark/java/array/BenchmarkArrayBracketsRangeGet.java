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

// java没有直接的copy方法, cj/go 均为引用
@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@Fork(1)
@State(Scope.Benchmark)
public class BenchmarkArrayBracketsRangeGet {
    static long[] arr_32 = new long[32];
    static long[] arr_256 = new long[256];
    static long[] arr_2048 = new long[2048];
    static long[] arr_1048576 = new long[1048576];

    @Setup(Level.Trial)
    public void setup() {
        Arrays.fill(arr_32, 0);
        Arrays.fill(arr_256, 0);
        Arrays.fill(arr_2048, 0);
        Arrays.fill(arr_1048576, 0);
    }

    @Benchmark
    public long[] BenchmarkArrayBracketsRangeGetD1_N32() {
        return Arrays.copyOfRange(arr_32, 0, 16);
    }

    @Benchmark
    public long[] BenchmarkArrayBracketsRangeGetD1_N256() {
        return Arrays.copyOfRange(arr_256, 0, 128);
    }

    @Benchmark
    public long[] BenchmarkArrayBracketsRangeGetD1_N2048() {
        return Arrays.copyOfRange(arr_2048, 0, 1024);
    }

    @Benchmark
    public long[] BenchmarkArrayBracketsRangeGetD1_N1048576() {
        return Arrays.copyOfRange(arr_1048576, 0, 524288);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayBracketsRangeGet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
