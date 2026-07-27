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
import java.util.concurrent.atomic.AtomicLong;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkAtomicInt64 {
    static AtomicLong atomicLong = new AtomicLong(0);

    @Setup(Level.Iteration)
    public void setup() {
        atomicLong = new AtomicLong(0);
    }

    @Benchmark
    public void BenchmarkAtomicAddInt64(Blackhole blackhole) {
        atomicLong.getAndIncrement();
        blackhole.consume(atomicLong);
    }

    @Benchmark
    public void BenchmarkAtomicCompareAndSwapInt64(Blackhole blackhole) {
        atomicLong.compareAndSet(1, 0);
        atomicLong.compareAndSet(0, 1);
        blackhole.consume(atomicLong);
    }

    @Benchmark
    public Long BenchmarkAtomicLoadInt64() {
        return atomicLong.get();
    }

    @Benchmark
    public void BenchmarkAtomicStoreInt64(Blackhole blackhole) {
        atomicLong.set(0);
        blackhole.consume(atomicLong);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkAtomicInt64.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
