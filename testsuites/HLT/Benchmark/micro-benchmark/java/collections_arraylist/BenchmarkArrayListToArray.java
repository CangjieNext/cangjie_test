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
public class BenchmarkArrayListToArray {
    static ArrayList<Integer> arr_16 = new ArrayList<Integer>();
    static ArrayList<Integer> arr_1024 = new ArrayList<Integer>();
    static ArrayList<Integer> arr_131072 = new ArrayList<Integer>();

    @Setup(Level.Trial)
    public void setup() {
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

    @Benchmark
    public Object[] BenchmarkArrayListToArray_N16() {
        return arr_16.toArray();
    }

    @Benchmark
    public Object[] BenchmarkArrayListToArray_N1024() {
        return arr_1024.toArray();
    }

    @Benchmark
    public Object[] BenchmarkArrayListToArray_N131072() {
        return arr_131072.toArray();
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListToArray.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
