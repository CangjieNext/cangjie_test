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
public class BenchmarkArrayDeque_toArray {
    ArrayDeque<Long> ArrayDeque_Int64_N8 = new ArrayDeque<Long>(8);
    ArrayDeque<Long> ArrayDeque_Int64_N64 = new ArrayDeque<Long>(64);
    ArrayDeque<Long> ArrayDeque_Int64_N256 = new ArrayDeque<Long>(256);
    ArrayDeque<Long> ArrayDeque_Int64_N1024 = new ArrayDeque<Long>(1024);

    public <T> void FillArrayDeque(ArrayDeque<T> arrayDeque, int capacity, T element) {
        for (int i = 0; i < capacity; i++) {
            arrayDeque.addLast(element);
        }
    }

    @Setup(Level.Invocation)
    public void setup() {
        FillArrayDeque(ArrayDeque_Int64_N8, 8, 0L);
        FillArrayDeque(ArrayDeque_Int64_N64, 64, 0L);
        FillArrayDeque(ArrayDeque_Int64_N256, 256, 0L);
        FillArrayDeque(ArrayDeque_Int64_N1024, 1024, 0L);
    }

    @Benchmark
    public void BenchmarkArrayDeque_toArray_Int64_N8(Blackhole blackhole) {
        blackhole.consume(ArrayDeque_Int64_N8.toArray());
    }

    @Benchmark
    public void BenchmarkArrayDeque_toArray_Int64_N64(Blackhole blackhole) {
        blackhole.consume(ArrayDeque_Int64_N64.toArray());
    }

    @Benchmark
    public void BenchmarkArrayDeque_toArray_Int64_N256(Blackhole blackhole) {
        blackhole.consume(ArrayDeque_Int64_N256.toArray());
    }

    @Benchmark
    public void BenchmarkArrayDeque_toArray_Int64_N1024(Blackhole blackhole) {
        blackhole.consume(ArrayDeque_Int64_N1024.toArray());
    }
    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayDeque_toArray.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
