/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_arraylist;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArrayListInsertAll {
    static ArrayList<Integer> arr_16 = new ArrayList<Integer>();
    static ArrayList<Integer> arr_1024 = new ArrayList<Integer>();
    static ArrayList<Integer> arr_131072 = new ArrayList<Integer>();

    static ArrayList<Integer> slice_16 = new ArrayList<Integer>();
    static ArrayList<Integer> slice_1024 = new ArrayList<Integer>();
    static ArrayList<Integer> slice_131072 = new ArrayList<Integer>();

    @Setup(Level.Invocation)
    public void setup() {
        arr_16 = new ArrayList<Integer>(16);
        arr_1024 = new ArrayList<Integer>(1024);
        arr_131072 = new ArrayList<Integer>(131072);
        for (int i = 0; i < 16; i++) {
            arr_16.add(i);
        }
        for (int i = 0; i < 1024; i++) {
            arr_1024.add(i);
        }
        for (int i = 0; i < 131072; i++) {
            arr_131072.add(i);
        }
    }

    @Setup(Level.Trial)
    public void makeSlice() {
        for (int i = 0; i < 16; i++) {
            slice_16.add(i);
        }
        for (int i = 0; i < 1024; i++) {
            slice_1024.add(i);
        }
        for (int i = 0; i < 131072; i++) {
            slice_131072.add(i);
        }
    }

    @Benchmark
    public void BenchmarkArrayListInsertAll_N16_start() {
        arr_16.addAll(0, slice_16);
    }

    @Benchmark
    public void BenchmarkArrayListInsertAll_N16_mid() {
        arr_16.addAll(8, slice_16);
    }

    @Benchmark
    public void BenchmarkArrayListInsertAll_N16_end() {
        arr_16.addAll(16, slice_16);
    }

    @Benchmark
    public void BenchmarkArrayListInsertAll_N1024_start() {
        arr_1024.addAll(0, slice_1024);
    }

    @Benchmark
    public void BenchmarkArrayListInsertAll_N1024_mid() {
        arr_1024.addAll(512, slice_1024);
    }

    @Benchmark
    public void BenchmarkArrayListInsertAll_N1024_end() {
        arr_1024.addAll(1024, slice_1024);
    }

    @Benchmark
    public void BenchmarkArrayListInsertAll_N131072_start() {
        arr_131072.addAll(0, slice_131072);
    }

    @Benchmark
    public void BenchmarkArrayListInsertAll_N131072_mid() {
        arr_131072.addAll(65536, slice_131072);
    }

    @Benchmark
    public void BenchmarkArrayListInsertAll_N131072_end() {
        arr_131072.addAll(131072, slice_131072);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListInsertAll.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
