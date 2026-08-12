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
public class BenchmarkTreeSet_removeLast {
    private TreeSet<Long> treeSet_Long_16;
    private TreeSet<String> treeSet_String_16;

    @Setup(Level.Invocation)
    public void setup() {
        treeSet_Long_16 = new TreeSet<Long>();
        for (long i = 0; i < 16; i++) {
            treeSet_Long_16.add(i);
        }

        treeSet_String_16 = new TreeSet<String>();
        for (long i = 0; i < 16; i++) {
            treeSet_String_16.add(String.valueOf(i));
        }
    }

    @Benchmark
    public void BenchmarkTreeSet_removeLast_Int64_N16(Blackhole blackhole) {
        Long result = treeSet_Long_16.pollLast();
        blackhole.consume(result);
    }

    @Benchmark
    public void BenchmarkTreeSet_removeLast_String_N16(Blackhole blackhole) {
        String result = treeSet_String_16.pollLast();
        blackhole.consume(result);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeSet_removeLast.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
