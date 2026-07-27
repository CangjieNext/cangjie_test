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
import java.util.Iterator;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArrayDeque_iterator {
    ArrayDeque<Long> ArrayDeque_Int64_N16 = new ArrayDeque<Long>(16);
    ArrayDeque<Long> ArrayDeque_Int64_N128 = new ArrayDeque<Long>(128);
    ArrayDeque<String> ArrayDeque_String_N16 = new ArrayDeque<String>(16);
    ArrayDeque<String> ArrayDeque_String_N128 = new ArrayDeque<String>(128);

    public <T> void FillArrayDeque(ArrayDeque<T> arrayDeque, int capacity, T element) {
        for (int i = 0; i < capacity; i++) {
            arrayDeque.addFirst(element);
        }
    }

    @Setup(Level.Iteration)
    public void setup() {
        FillArrayDeque(ArrayDeque_Int64_N16, 16, 0L);
        FillArrayDeque(ArrayDeque_Int64_N128, 128, 0L);
        FillArrayDeque(ArrayDeque_String_N16, 16, "test");
        FillArrayDeque(ArrayDeque_String_N128, 128, "test");
    }

    @Benchmark
    public void BenchmarkArrayDeque_iterator_Int64_N16(Blackhole blackhole) {
        Iterator<Long> iter = ArrayDeque_Int64_N16.iterator();
        while (iter.hasNext()) {
            iter.next();
        }
    }

    @Benchmark
    public void BenchmarkArrayDeque_iterator_Int64_N128(Blackhole blackhole) {
        Iterator<Long> iter = ArrayDeque_Int64_N128.iterator();
        while (iter.hasNext()) {
            iter.next();
        }
    }

    @Benchmark
    public void BenchmarkArrayDeque_iterator_String_N16(Blackhole blackhole) {
        Iterator<String> iter = ArrayDeque_String_N16.iterator();
        while (iter.hasNext()) {
            iter.next();
        }
    }

    @Benchmark
    public void BenchmarkArrayDeque_iterator_String_N128(Blackhole blackhole) {
        Iterator<String> iter = ArrayDeque_String_N128.iterator();
        while (iter.hasNext()) {
            iter.next();
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayDeque_iterator.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
