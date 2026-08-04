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
public class BenchmarkArrayInitializationD3 {
    static int num32 = 32;
    static int num256 = 256;

    public long[][][] fill_D3_Array(long[][][] arr) {
        for (long[][] Array_D2 : arr) {
            for (long[] Array_D3 : Array_D2) {
                Arrays.fill(Array_D3, 0);
            }
        }
        return arr;
    }

    @Benchmark
    public long[][][] BenchmarkArrayInitializationD3_N32() {
        return new long[num32][num32][num32];
    }

    @Benchmark
    public long[][][] BenchmarkArrayInitializationD3_N256() {
        return new long[num256][num256][num256];
    }

    @Benchmark
    public long[][][] BenchmarkArrayInitDataD3_N32() {
        long[][][] arr = new long[num32][num32][num32];
        arr = fill_D3_Array(arr);
        return arr;
    }

    @Benchmark
    public long[][][] BenchmarkArrayInitDataD3_N256() {
        long[][][] arr = new long[num256][num256][num256];
        arr = fill_D3_Array(arr);
        return arr;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayInitializationD3.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
