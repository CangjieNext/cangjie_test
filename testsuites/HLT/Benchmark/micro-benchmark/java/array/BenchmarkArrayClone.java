/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package array;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
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
public class BenchmarkArrayClone {
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
    public void BenchmarkArrayCloneD1_N32(Blackhole blackhole) {
        long[] array =  arr_32.clone();
        blackhole.consume(array);
    }

    @Benchmark
    public void BenchmarkArrayCloneD1_N256(Blackhole blackhole) {
        long[] array =  arr_256.clone();
        blackhole.consume(array);
    }

    @Benchmark
    public void BenchmarkArrayCloneD1_N2048(Blackhole blackhole) {
        long[] array =  arr_2048.clone();
        blackhole.consume(array);
    }

    @Benchmark
    public void BenchmarkArrayCloneD1_N1048576(Blackhole blackhole) {
        long[] array =  arr_1048576.clone();
        blackhole.consume(array);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayClone.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
