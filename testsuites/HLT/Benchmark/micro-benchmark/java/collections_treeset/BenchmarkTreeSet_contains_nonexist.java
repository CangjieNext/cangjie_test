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
public class BenchmarkTreeSet_contains_nonexist {
    private TreeSet<Long> treeSet_Long_16;
    private TreeSet<Long> treeSet_Long_256;
    private TreeSet<Long> treeSet_Long_2048;
    private TreeSet<Long> treeSet_Long_16384;

    private TreeSet<String> treeSet_String_16;
    private TreeSet<String> treeSet_String_256;
    private TreeSet<String> treeSet_String_2048;
    private TreeSet<String> treeSet_String_16384;

    @Setup(Level.Invocation)
    public void setup() {
        treeSet_Long_16 = new TreeSet<Long>();
        for (long i = 0; i < 16; i++) {
            treeSet_Long_16.add(i);
        }

        treeSet_Long_256 = new TreeSet<Long>();
        for (long i = 0; i < 256; i++) {
            treeSet_Long_256.add(i);
        }

        treeSet_Long_2048 = new TreeSet<Long>();
        for (long i = 0; i < 2048; i++) {
            treeSet_Long_2048.add(i);
        }

        treeSet_Long_16384 = new TreeSet<Long>();
        for (long i = 0; i < 16384; i++) {
            treeSet_Long_16384.add(i);
        }

        treeSet_String_16 = new TreeSet<String>();
        for (long i = 0; i < 16; i++) {
            treeSet_String_16.add(String.valueOf(i));
        }

        treeSet_String_256 = new TreeSet<String>();
        for (long i = 0; i < 256; i++) {
            treeSet_String_256.add(String.valueOf(i));
        }

        treeSet_String_2048 = new TreeSet<String>();
        for (long i = 0; i < 2048; i++) {
            treeSet_String_2048.add(String.valueOf(i));
        }

        treeSet_String_16384 = new TreeSet<String>();
        for (long i = 0; i < 16384; i++) {
            treeSet_String_16384.add(String.valueOf(i));
        }
    }

    @Benchmark
    public void BenchmarkTreeSet_contains_nonexist_Int64_N16(Blackhole blackhole) {
        boolean flag = treeSet_Long_16.contains(-8L);
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeSet_contains_nonexist_Int64_N256(Blackhole blackhole) {
        boolean flag = treeSet_Long_256.contains(-128L);
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeSet_contains_nonexist_Int64_N2048(Blackhole blackhole) {
        boolean flag = treeSet_Long_2048.contains(-1024L);
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeSet_contains_nonexist_Int64_N16384(Blackhole blackhole) {
        boolean flag = treeSet_Long_16384.contains(-8192L);
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeSet_contains_nonexist_String_N16(Blackhole blackhole) {
        boolean flag = treeSet_String_16.contains("-8");
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeSet_contains_nonexist_String_N256(Blackhole blackhole) {
        boolean flag = treeSet_String_256.contains("-128");
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeSet_contains_nonexist_String_N2048(Blackhole blackhole) {
        boolean flag = treeSet_String_2048.contains("-1024");
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeSet_contains_nonexist_String_N16384(Blackhole blackhole) {
        boolean flag = treeSet_String_16384.contains("-8192");
        blackhole.consume(flag);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeSet_contains_nonexist.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
