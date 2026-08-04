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
public class BenchmarkArrayListAppendAll {
    static ArrayList<Integer> arr_16 = new ArrayList<Integer>();
    static ArrayList<Integer> arr_128 = new ArrayList<Integer>();
    static ArrayList<Integer> arr_1024 = new ArrayList<Integer>();
    static ArrayList<Integer> arr_8192 = new ArrayList<Integer>();
    static ArrayList<Integer> arr_65536 = new ArrayList<Integer>();
    static ArrayList<Integer> arrayList = new ArrayList<Integer>(){};

    @Setup(Level.Trial)
    public void setup() {
        for (int i = 0; i < 16; i++) {
            arr_16.add(i);
        }
        for (int i = 0; i < 128; i++) {
            arr_128.add(i);
        }
        for (int i = 0; i < 1024; i++) {
            arr_1024.add(i);
        }
        for (int i = 0; i < 8192; i++) {
            arr_8192.add(i);
        }
        for (int i = 0; i < 65536; i++) {
            arr_65536.add(i);
        }
    }

    @Setup(Level.Invocation)
    public void initArray() {
        arrayList = new ArrayList<Integer>(){};
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAll_N16() {
        arrayList.addAll(arr_16);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAll_N128() {
        arrayList.addAll(arr_128);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAll_N1024() {
        arrayList.addAll(arr_1024);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAll_N8192() {
        arrayList.addAll(arr_8192);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAll_N65536() {
        arrayList.addAll(arr_65536);
        return arrayList;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListAppendAll.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
