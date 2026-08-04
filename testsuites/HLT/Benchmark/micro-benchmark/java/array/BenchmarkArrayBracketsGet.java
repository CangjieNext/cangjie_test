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
public class BenchmarkArrayBracketsGet {
    static long[] arr_D1_32 = new long[32];
    static long[] arr_D1_256 = new long[256];
    static long[] arr_D1_2048 = new long[2048];
    static long[] arr_D1_1048576 = new long[1048576];

    static long[][] arr_D2_32 = new long[32][32];
    static long[][] arr_D2_256 = new long[256][256];
    static long[][] arr_D2_2048 = new long[2048][2048];

    static long[][][] arr_D3_32 = new long[32][32][32];
    static long[][][] arr_D3_128 = new long[128][128][128];

    static int arrLen = 0;
    static long element = 0;

    @Setup(Level.Trial)
    public void setup() {
        Arrays.fill(arr_D1_32, 0);
        Arrays.fill(arr_D1_256, 0);
        Arrays.fill(arr_D1_2048, 0);
        Arrays.fill(arr_D1_1048576, 0);
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
    public void BenchmarkArrayBracketsGetD1(Blackhole blackhole) {
        int index = 32 / 2;
        element = arr_D1_32[index];
        blackhole.consume(element);
    }

    // In here and below tests, benchmark should use calculated index
    // rather direct number to avoid some optimizations
    @Benchmark
    public void BenchmarkArrayBracketsGetD1_N32(Blackhole blackhole) {
        arrLen = 32;
        int index = arrLen / 2;
        element = arr_D1_32[index];
        blackhole.consume(element);
    }

    @Benchmark
    public void BenchmarkArrayBracketsGetD1_N256(Blackhole blackhole) {
        arrLen = 256;
        int index = arrLen / 2;
        element = arr_D1_256[index];
        blackhole.consume(element);
    }

    @Benchmark
    public void BenchmarkArrayBracketsGetD1_N2048(Blackhole blackhole) {
        arrLen = 2048;
        int index = arrLen / 2;
        element = arr_D1_2048[index];
        blackhole.consume(element);
    }

    @Benchmark
    public void BenchmarkArrayBracketsGetD1_N1048576(Blackhole blackhole) {
        arrLen = 1048576;
        int index = arrLen / 2;
        element = arr_D1_1048576[index];
        blackhole.consume(element);
    }

    @Benchmark
    public void BenchmarkArrayBracketsGetD2(Blackhole blackhole) {
        int index = 32 / 2;
        element = arr_D2_32[index][index];
        blackhole.consume(element);
    }

    @Benchmark
    public void BenchmarkArrayBracketsGetD2_N32(Blackhole blackhole) {
        arrLen = 32;
        int index = arrLen / 2;
        element = arr_D2_32[index][index];
        blackhole.consume(element);
    }

    @Benchmark
    public void BenchmarkArrayBracketsGetD2_N256(Blackhole blackhole) {
        arrLen = 256;
        int index = arrLen / 2;
        element = arr_D2_256[index][index];
        blackhole.consume(element);
    }

    @Benchmark
    public void BenchmarkArrayBracketsGetD2_N2048(Blackhole blackhole) {
        arrLen = 2048;
        int index = arrLen / 2;
        element = arr_D2_2048[index][index];
        blackhole.consume(element);
    }

    @Benchmark
    public void BenchmarkArrayBracketsGetD3(Blackhole blackhole) {
        int index = 32 / 2;
        element = arr_D3_32[index][index][index];
        blackhole.consume(element);
    }

    @Benchmark
    public void BenchmarkArrayBracketsGetD3_N32(Blackhole blackhole) {
        arrLen = 32;
        int index = arrLen / 2;
        element = arr_D3_32[index][index][index];
        blackhole.consume(element);
    }

    // 256大小 oom
    @Benchmark
    public void BenchmarkArrayBracketsGetD3_N256(Blackhole blackhole) {
        arrLen = 128;
        int index = arrLen / 2;
        element = arr_D3_128[index][index][index];
        blackhole.consume(element);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(array.BenchmarkArrayBracketsGet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
