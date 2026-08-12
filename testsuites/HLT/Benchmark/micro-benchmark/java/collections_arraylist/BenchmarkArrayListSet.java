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
public class BenchmarkArrayListSet {
    static ArrayList<String> arr_16 = new ArrayList<String>();
    static ArrayList<String> arr_128 = new ArrayList<String>();
    static ArrayList<String> arr_1024 = new ArrayList<String>();
    static ArrayList<String> arr_1048576 = new ArrayList<String>();
    static ArrayList<Integer> int_16 = new ArrayList<Integer>();
    static ArrayList<Integer> int_128 = new ArrayList<Integer>();
    static ArrayList<Integer> int_1024 = new ArrayList<Integer>();
    static ArrayList<Integer> int_1048576 = new ArrayList<Integer>();

    @Setup(Level.Trial)
    public void setup() {
        for (int i = 0; i < 16; i++) {
            arr_16.add("cj");
        }
        for (int i = 0; i < 128; i++) {
            arr_128.add("cj");
        }
        for (int i = 0; i < 1024; i++) {
            arr_1024.add("cj");
        }
        for (int i = 0; i < 1048576; i++) {
            arr_1048576.add("cj");
        }
        for (int i = 0; i < 16; i++) {
            int_16.add(i);
        }
        for (int i = 0; i < 128; i++) {
            int_128.add(i);
        }
        for (int i = 0; i < 1024; i++) {
            int_1024.add(i);
        }
        for (int i = 0; i < 1048576; i++) {
            int_1048576.add(i);
        }
    }

    @Benchmark
    public void BenchmarkArrayListSet_N16() {
        arr_16.set(8, "a");
    }

    @Benchmark
    public void BenchmarkArrayListSet_N128() {
        arr_128.set(64, "a");
    }

    @Benchmark
    public void BenchmarkArrayListSet_N1024() {
        arr_1024.set(512, "a");
    }

    @Benchmark
    public void BenchmarkArrayListSet_N1048576() {
        arr_1048576.set(500000, "a");
    }

    @Benchmark
    public void BenchmarkArrayListSet_Int64_N16() {
        int_16.set(8, 123);
    }

    @Benchmark
    public void BenchmarkArrayListSet_Int64_N128() {
        int_128.set(64, 123);
    }

    @Benchmark
    public void BenchmarkArrayListSet_Int64_N1024() {
        int_1024.set(512, 123);
    }

    @Benchmark
    public void BenchmarkArrayListSet_Int64_N1048576() {
        int_1048576.set(500000, 123);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListSet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
