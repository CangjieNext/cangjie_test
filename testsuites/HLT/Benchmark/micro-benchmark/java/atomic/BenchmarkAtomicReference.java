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
import java.util.concurrent.atomic.AtomicReference;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkAtomicReference {
    static AtomicReference<A> aAtomicReference = new AtomicReference<A>(new A(0));

    @Setup(Level.Iteration)
    public void setup() {
        aAtomicReference = new AtomicReference<A>(new A(0));
    }

    @Benchmark
    public void BenchmarkAtomicCompareAndSwapReference(Blackhole blackhole) {
        aAtomicReference.compareAndSet(new A(0), new A(1));
        aAtomicReference.compareAndSet(new A(1), new A(0));
        blackhole.consume(aAtomicReference);
    }

    @Benchmark
    public A BenchmarkAtomicLoadReference() {
        return aAtomicReference.get();
    }

    @Benchmark
    public void BenchmarkAtomicStoreReference(Blackhole blackhole) {
        aAtomicReference.set(new A(1));
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkAtomicReference.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
