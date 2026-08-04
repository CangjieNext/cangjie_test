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

import java.util.TreeSet;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkTreeSet_first {
    private TreeSet<Long> treeSet_16;
    private TreeSet<Long> treeSet_256;
    private TreeSet<Long> treeSet_2048;
    private TreeSet<Long> treeSet_16384;

    @Setup(Level.Invocation)
    public void setup() {
        treeSet_16 = new TreeSet<Long>();
        for (long i = 0; i < 16; i++) {
            treeSet_16.add(i);
        }

        treeSet_256 = new TreeSet<Long>();
        for (long i = 0; i < 256; i++) {
            treeSet_256.add(i);
        }

        treeSet_2048 = new TreeSet<Long>();
        for (long i = 0; i < 2048; i++) {
            treeSet_2048.add(i);
        }

        treeSet_16384 = new TreeSet<Long>();
        for (long i = 0; i < 16384; i++) {
            treeSet_16384.add(i);
        }
    }

    @Benchmark
    public void BenchmarkTreeSet_first_Int64_N16(Blackhole blackhole) {
        Long value = treeSet_16.first();
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeSet_first_Int64_N256(Blackhole blackhole) {
        Long value = treeSet_256.first();
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeSet_first_Int64_N2048(Blackhole blackhole) {
        Long value = treeSet_2048.first();
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeSet_first_Int64_N16384(Blackhole blackhole) {
        Long value = treeSet_16384.first();
        blackhole.consume(value);
    }
    
    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeSet_first.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
