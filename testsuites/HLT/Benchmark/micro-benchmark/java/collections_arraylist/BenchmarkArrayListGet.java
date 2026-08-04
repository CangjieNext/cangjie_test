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
public class BenchmarkArrayListGet {
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
    public String BenchmarkArrayListBrackets_N16() {
        return arr_16.get(8);
    }

    @Benchmark
    public String BenchmarkArrayListBrackets_N128() {
        return arr_128.get(64);
    }

    @Benchmark
    public String BenchmarkArrayListBrackets_N1024() {
        return arr_1024.get(512);
    }

    @Benchmark
    public String BenchmarkArrayListBrackets_N1048576() {
        return arr_1048576.get(500000);
    }

    @Benchmark
    public String BenchmarkArrayListBrackets_Int64_N16() {
        return arr_16.get(8);
    }

    @Benchmark
    public String BenchmarkArrayListBrackets_Int64_N128() {
        return arr_128.get(64);
    }

    @Benchmark
    public String BenchmarkArrayListBrackets_Int64_N1024() {
        return arr_1024.get(512);
    }

    @Benchmark
    public String BenchmarkArrayListBrackets_Int64_N1048576() {
        return arr_1048576.get(500000);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListGet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
