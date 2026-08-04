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
public class BenchmarkArrayDeque_removeLast {
    ArrayDeque<Long> ArrayDeque_Int64 = new ArrayDeque<Long>();
    ArrayDeque<Byte> ArrayDeque_UInt8 = new ArrayDeque<Byte>();
    ArrayDeque<String> ArrayDeque_String = new ArrayDeque<String>();
    ArrayDeque<Long> ArrayDeque_Int64_N128 = new ArrayDeque<Long>(128);
    byte aByte = 0;

    public <T> void FillArrayDeque(ArrayDeque<T> arrayDeque, int capacity, T element) {
        for (int i = 0; i < capacity; i++) {
            arrayDeque.addLast(element);
        }
    }

    @Setup(Level.Invocation)
    public void setup() {
        FillArrayDeque(ArrayDeque_Int64, 8, 0L);
        FillArrayDeque(ArrayDeque_UInt8, 8, aByte);
        FillArrayDeque(ArrayDeque_String, 8, "test");
        FillArrayDeque(ArrayDeque_Int64_N128, 128, 0L);
    }

    @Benchmark
    public void BenchmarkArrayDeque_removeLast_Int64_N8(Blackhole blackhole) {
        blackhole.consume(ArrayDeque_Int64.pollLast());
    }

    @Benchmark
    public void BenchmarkArrayDeque_removeLast_UInt8(Blackhole blackhole) {
        blackhole.consume(ArrayDeque_UInt8.pollLast());
    }

    @Benchmark
    public void BenchmarkArrayDeque_removeLast_String(Blackhole blackhole) {
        blackhole.consume(ArrayDeque_String.pollLast());
    }

    @Benchmark
    public void BenchmarkArrayDeque_removeLast_Int64_N128(Blackhole blackhole) {
        blackhole.consume(ArrayDeque_Int64_N128.pollLast());
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayDeque_removeLast.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
