/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_arraydeque;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.ArrayDeque;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArrayDeque_clear {
    ArrayDeque<Long> ArrayDeque_Int64_N16 = new ArrayDeque<Long>();
    ArrayDeque<Long> ArrayDeque_Int64_N1024 = new ArrayDeque<Long>();
    ArrayDeque<Long> ArrayDeque_Int64_N131072 = new ArrayDeque<Long>();

    @Setup(Level.Invocation)
    public void setup() {
        ArrayDeque_Int64_N16 = new ArrayDeque<Long>(16);
        for (long i = 0; i < 16; i++) {
            ArrayDeque_Int64_N16.addFirst(i);
        }
        ArrayDeque_Int64_N1024 = new ArrayDeque<Long>(1024);
        for (long i = 0; i < 1024; i++) {
            ArrayDeque_Int64_N1024.addFirst(i);
        }
        ArrayDeque_Int64_N131072 = new ArrayDeque<Long>(131072);
        for (long i = 0; i < 131072; i++) {
            ArrayDeque_Int64_N131072.addFirst(i);
        }
    }

    @Benchmark
    public void BenchmarkArrayDeque_clear_N16(Blackhole blackhole) {
        ArrayDeque_Int64_N16.clear();
    }

    @Benchmark
    public void BenchmarkArrayDeque_clear_N1024(Blackhole blackhole) {
        ArrayDeque_Int64_N1024.clear();
    }

    @Benchmark
    public void BenchmarkArrayDeque_clear_N131072(Blackhole blackhole) {
        ArrayDeque_Int64_N131072.clear();
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayDeque_clear.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
