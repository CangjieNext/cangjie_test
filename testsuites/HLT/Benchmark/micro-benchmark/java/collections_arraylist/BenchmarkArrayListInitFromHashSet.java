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
public class BenchmarkArrayListInitFromHashSet {
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

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitFromHashSet_N16() {
        return new ArrayList<Integer>(hashSet_16);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitFromHashSet_N128() {
        return new ArrayList<Integer>(hashSet_128);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitFromHashSet_N1024() {
        return new ArrayList<Integer>(hashSet_1024);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitFromHashSet_N8192() {
        return new ArrayList<Integer>(hashSet_8192);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitFromHashSet_N65536() {
        return new ArrayList<Integer>(hashSet_8192);
    }
    

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListInitFromHashSet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
