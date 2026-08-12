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
public class BenchmarkArrayBracketsSet {
    static long[] arr_32 = new long[32];
    static long[] arr_256 = new long[256];
    static long[] arr_2048 = new long[2048];
    static long[] arr_1048576 = new long[1048576];

    static long[][] arr_D2_32 = new long[32][32];
    static long[][] arr_D2_256 = new long[256][256];
    static long[][] arr_D2_2048 = new long[2048][2048];

    static long[][][] arr_D3_32 = new long[32][32][32];
    static long[][][] arr_D3_128 = new long[128][128][128];

    static long element = 0;

    @Setup(Level.Trial)
    public void setup() {
        Arrays.fill(arr_32, 0);
        Arrays.fill(arr_256, 0);
        Arrays.fill(arr_2048, 0);
        Arrays.fill(arr_1048576, 0);
        for (long[] singleArray : arr_D2_32) {
            Arrays.fill(singleArray, 0);
        }
        for (long[] singleArray : arr_D2_256) {
            Arrays.fill(singleArray, 0);
        }
        for (long[] singleArray : arr_D2_2048) {
            Arrays.fill(singleArray, 0);
        }

        for (long[][] Array_D2 : arr_D3_32) {
            for (long[] Array_D3 : Array_D2) {
                Arrays.fill(Array_D3, 0);
            }
        }
        for (long[][] Array_D2 : arr_D3_128) {
            for (long[] Array_D3 : Array_D2) {
                Arrays.fill(Array_D3, 0);
            }
        }
    }

    @Benchmark
    public void BenchmarkArrayBracketsSetD1_N32() {
        arr_32[16] = element;
    }

    @Benchmark
    public void BenchmarkArrayBracketsSetD1_N256() {
        arr_256[128] = element;
    }

    @Benchmark
    public void BenchmarkArrayBracketsSetD1_N2048() {
        arr_2048[1024] = element;
    }

    @Benchmark
    public void BenchmarkArrayBracketsSetD1_N1048576() {
        arr_1048576[524288] = element;
    }


    @Benchmark
    public void BenchmarkArrayBracketsSetD2_N32() {
        arr_D2_32[16][16] = element;
    }

    @Benchmark
    public void BenchmarkArrayBracketsSetD2_N256() {
        arr_D2_256[128][128] = element;
    }

    @Benchmark
    public void BenchmarkArrayBracketsSetD2_N2048() {
        arr_D2_2048[1024][1024] = element;
    }

    @Benchmark
    public void BenchmarkArrayBracketsSetD3_N32() {
        arr_D3_32[16][16][16] = element;
    }

    @Benchmark
    public void BenchmarkArrayBracketsSetD3_N256() {
        arr_D3_128[64][64][64] = element;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayBracketsSet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
