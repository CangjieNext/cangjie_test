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

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicReference;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkConcurrencyAtomicReference {
    static AtomicReference<A> atomicReference = new AtomicReference<A>(new A(0));
    static Integer reps = 10;

    @Setup(Level.Iteration)
    public void setup() {
        atomicReference = new AtomicReference<A>(new A(0));
    }

    @Benchmark
    public void BenchmarkConcurrencyAtomicReferenceCas(Blackhole blackhole) {
        AtomicReference<A> test = new AtomicReference<A>(new A(1));
        ExecutorService executorService = Executors.newFixedThreadPool(reps);
        for (int i = 0; i < reps; i++) {
            executorService.execute(() -> {
                for (int j = 0; j < 10000; j++) {
                    atomicReference.compareAndSet(new A(0), new A(1));
                    atomicReference.compareAndSet(new A(1), new A(0));
                }
            });
        }
        executorService.shutdown();
        while (!executorService.isTerminated()) {
            // 等待所有线程执行完毕
        }
        blackhole.consume(atomicReference);
    }

    @Benchmark
    public void BenchmarkConcurrencyAtomicReferenceLoad(Blackhole blackhole) {
        AtomicReference<A> test = new AtomicReference<A>(new A(1));
        ExecutorService executorService = Executors.newFixedThreadPool(reps);
        for (int i = 0; i < reps; i++) {
            executorService.execute(() -> {
                for (int j = 0; j < 10000; j++) {
                    atomicReference.get();
                }
            });
        }
        executorService.shutdown();
        while (!executorService.isTerminated()) {
            // 等待所有线程执行完毕
        }
        blackhole.consume(atomicReference);
    }

    @Benchmark
    public void BenchmarkConcurrencyAtomicReferenceStore(Blackhole blackhole) {
        AtomicReference<A> test = new AtomicReference<A>(new A(1));
        ExecutorService executorService = Executors.newFixedThreadPool(reps);
        for (int i = 0; i < reps; i++) {
            executorService.execute(() -> {
                for (int j = 0; j < 10000; j++) {
                    atomicReference.set(new A(1));
                }
            });
        }
        executorService.shutdown();
        while (!executorService.isTerminated()) {
            // 等待所有线程执行完毕
        }
        blackhole.consume(atomicReference);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkConcurrencyAtomicReference.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
