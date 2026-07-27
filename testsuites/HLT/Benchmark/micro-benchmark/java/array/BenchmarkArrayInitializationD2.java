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
public class BenchmarkArrayInitializationD2 {
    static int num32 = 32;
    static int num256 = 256;
    static int num2048 = 2048;

    @Benchmark
    public long[][] BenchmarkArrayInitializationD2_N32() {
        return new long[num32][num32];
    }

    @Benchmark
    public long[][] BenchmarkArrayInitializationD2_N256() {
        return new long[num256][num256];
    }

    @Benchmark
    public long[][] BenchmarkArrayInitializationD2_N2048() {
        return new long[num2048][num2048];
    }

    @Benchmark
    public long[][] BenchmarkArrayInitDataD2_N32() {
        long[][] arr = new long[num32][num32];
        for (long[] singleArray : arr) {
            Arrays.fill(singleArray, 0);
        }
        return arr;
    }

    @Benchmark
    public long[][] BenchmarkArrayInitDataD2_N256() {
        long[][] arr = new long[num256][num256];
        for (long[] singleArray : arr) {
            Arrays.fill(singleArray, 0);
        }
        return arr;
    }

    @Benchmark
    public long[][] BenchmarkArrayInitDataD2_N2048() {
        long[][] arr = new long[num2048][num2048];
        for (long[] singleArray : arr) {
            Arrays.fill(singleArray, 0);
        }
        return arr;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayInitializationD2.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
