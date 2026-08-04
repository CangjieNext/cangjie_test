/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_hashset;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.HashSet;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkPutClassToHashSet {
    @Param(value = {"32", "256", "2048", "16384", "131072"})
    static int counts;
    static HashSet<Person> hashSet;

    @Setup(Level.Invocation)
    public void setup() {
        hashSet = new HashSet<Person>();
    }

    @Benchmark
    public HashSet<Person> BenchmarkAddToHashset_Class() {
        for (int i = 0; i < counts; i++) {
            hashSet.add(new Person(Integer.toString(i),i));
        }
        return hashSet;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkPutClassToHashSet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
