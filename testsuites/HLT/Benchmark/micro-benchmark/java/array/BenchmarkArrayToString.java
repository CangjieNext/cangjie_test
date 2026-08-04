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
public class BenchmarkArrayToString {
    static int[] arr_32 = new int[32];
    static int[] arr_256 = new int[256];
    static int[] arr_2048 = new int[2048];
    static int[] arr_1048576 = new int[1048576];

    static int[][] arr_D2_32 = new int[32][32];
    static int[][] arr_D2_256 = new int[256][256];
    static int[][] arr_D2_2048 = new int[2048][2048];

    static int[][][] arr_D3_32 = new int[32][32][32];
    static int[][][] arr_D3_128 = new int[128][128][128];

    @Setup(Level.Trial)
    public void setup() {
        Arrays.fill(arr_32, 0);
        Arrays.fill(arr_256, 0);
        Arrays.fill(arr_2048, 0);
        Arrays.fill(arr_1048576, 0);
        for (int[] singleArray : arr_D2_32) {
            Arrays.fill(singleArray, 0);
        }
        for (int[] singleArray : arr_D2_256) {
            Arrays.fill(singleArray, 0);
        }
        for (int[] singleArray : arr_D2_2048) {
            Arrays.fill(singleArray, 0);
        }

        for (int[][] Array_D2 : arr_D3_32) {
            for (int[] Array_D3 : Array_D2) {
                Arrays.fill(Array_D3, 0);
            }
        }
        for (int[][] Array_D2 : arr_D3_128) {
            for (int[] Array_D3 : Array_D2) {
                Arrays.fill(Array_D3, 0);
            }
        }
    }

    @Benchmark
    public void BenchmarkArrayToStringD1_N32(Blackhole blackhole) {
        String string = Arrays.toString(arr_32);
        blackhole.consume(string);
    }

    @Benchmark
    public void BenchmarkArrayToStringD1_N256(Blackhole blackhole) {
        String string = Arrays.toString(arr_256);
        blackhole.consume(string);
    }

    @Benchmark
    public void BenchmarkArrayToStringD1_N2048(Blackhole blackhole) {
        String string = Arrays.toString(arr_2048);
        blackhole.consume(string);
    }

    @Benchmark
    public void BenchmarkArrayToStringD1_N1048576(Blackhole blackhole) {
        String string = Arrays.toString(arr_1048576);
        blackhole.consume(string);
    }


    @Benchmark
    public void BenchmarkArrayToStringD2_N32(Blackhole blackhole) {
        String string = Arrays.deepToString(arr_D2_32);
        blackhole.consume(string);
    }

    @Benchmark
    public void BenchmarkArrayToStringD2_N256(Blackhole blackhole) {
        String string = Arrays.deepToString(arr_D2_256);
        blackhole.consume(string);
    }

    @Benchmark
    public void BenchmarkArrayToStringD2_N2048(Blackhole blackhole) {
        String string = Arrays.deepToString(arr_D2_2048);
        blackhole.consume(string);
    }

    @Benchmark
    public void BenchmarkArrayToStringD3_N32(Blackhole blackhole) {
        String string = Arrays.deepToString(arr_D3_32);
        blackhole.consume(string);
    }

    @Benchmark
    public void BenchmarkArrayToStringD3_N128(Blackhole blackhole) {
        String string = Arrays.deepToString(arr_D3_128);
        blackhole.consume(string);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayToString.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
