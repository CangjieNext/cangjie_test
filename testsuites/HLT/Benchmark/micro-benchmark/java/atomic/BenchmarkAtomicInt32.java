/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package atomic;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkAtomicInt32 {
    static AtomicInteger atomicInteger = new AtomicInteger(0);

    @Setup(Level.Iteration)
    public void setup() {
        atomicInteger = new AtomicInteger(0);
    }

    @Benchmark
    public void BenchmarkAtomicAddInt32(Blackhole blackhole) {
        atomicInteger.getAndIncrement();
        blackhole.consume(atomicInteger);
    }

    @Benchmark
    public void BenchmarkAtomicCompareAndSwapInt32(Blackhole blackhole) {
        atomicInteger.compareAndSet(1, 0);
        atomicInteger.compareAndSet(0, 1);
        blackhole.consume(atomicInteger);
    }

    @Benchmark
    public Integer BenchmarkAtomicLoadInt32() {
        return atomicInteger.get();
    }

    @Benchmark
    public void BenchmarkAtomicStoreInt32(Blackhole blackhole) {
        atomicInteger.set(0);
        blackhole.consume(atomicInteger);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkAtomicInt32.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
