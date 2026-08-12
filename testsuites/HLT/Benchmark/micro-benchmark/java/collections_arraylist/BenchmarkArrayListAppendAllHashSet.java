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
import java.util.HashSet;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArrayListAppendAllHashSet {
    static ArrayList<Integer> arrayList = new ArrayList<Integer>();
    static HashSet<Integer> hashSet_16 = new HashSet<Integer>(16);
    static HashSet<Integer> hashSet_128 = new HashSet<Integer>(128);
    static HashSet<Integer> hashSet_1024 = new HashSet<Integer>(1024);
    static HashSet<Integer> hashSet_8192 = new HashSet<Integer>(8192);
    static HashSet<Integer> hashSet_65536 = new HashSet<Integer>(65536);

    @Setup(Level.Trial)
    public void setup() {
        for (int i = 0; i < 16; i++) {
            hashSet_16.add(i);
        }
        for (int i = 0; i < 128; i++) {
            hashSet_128.add(i);
        }
        for (int i = 0; i < 1024; i++) {
            hashSet_1024.add(i);
        }
        for (int i = 0; i < 8192; i++) {
            hashSet_8192.add(i);
        }
        for (int i = 0; i < 65536; i++) {
            hashSet_65536.add(i);
        }
    }

    @Setup(Level.Invocation)
    public void setupArray() {
        arrayList = new ArrayList<Integer>(16);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAllHashSet_N16() {
        arrayList.addAll(hashSet_16);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAllHashSet_N128() {
        arrayList.addAll(hashSet_128);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAllHashSet_N1024() {
        arrayList.addAll(hashSet_1024);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAllHashSet_N8192() {
        arrayList.addAll(hashSet_8192);
        return arrayList;
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListAppendAllHashSet_N65536() {
        arrayList.addAll(hashSet_65536);
        return arrayList;
    }


    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListAppendAllHashSet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
