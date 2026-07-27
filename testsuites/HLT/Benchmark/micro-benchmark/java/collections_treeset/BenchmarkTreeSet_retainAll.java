/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_treeset;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.HashSet;
import java.util.TreeSet;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkTreeSet_retainAll {
    private TreeSet<Long> treeSet16;
    private HashSet<Long> hashSet16;

    private TreeSet<Long> treeSet256;
    private HashSet<Long> hashSet256;

    private TreeSet<Long> treeSet4096;
    private HashSet<Long> hashSet4096;

    @Setup(Level.Invocation)
    public void setup() {
        treeSet16 = new TreeSet<Long>();
        hashSet16 = new HashSet<Long>();
        for (long i = 0; i < 16; i++) {
            treeSet16.add(i);
            hashSet16.add(i - (i % 2));
        }

        treeSet256 = new TreeSet<Long>();
        hashSet256 = new HashSet<Long>();
        for (long i = 0; i < 256; i++) {
            treeSet256.add(i);
            hashSet256.add(i - (i % 2));
        }

        treeSet4096 = new TreeSet<Long>();
        hashSet4096 = new HashSet<Long>();
        for (long i = 0; i < 4096; i++) {
            treeSet4096.add(i);
            hashSet4096.add(i - (i % 2));
        }
    }

    @Benchmark
    public void BenchmarkTreeSet_retainAll_Int64_N16() {
        treeSet16.retainAll(hashSet16);
    }

    @Benchmark
    public void BenchmarkTreeSet_retainAll_Int64_N256() {
        treeSet256.retainAll(hashSet256);
    }

    @Benchmark
    public void BenchmarkTreeSet_retainAll_Int64_N4096() {
        treeSet4096.retainAll(hashSet4096);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeSet_retainAll.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
