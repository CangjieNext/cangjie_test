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
import java.util.concurrent.atomic.AtomicLong;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkConcurrencyAtomicInt64 {
    static AtomicLong atomicLong = new AtomicLong(0);
    static Integer reps = 10;


    @Setup(Level.Iteration)
    public void setup() {
        atomicLong = new AtomicLong(0);
    }

    @Benchmark
    public void BenchmarkConcurrencyAddInt64(Blackhole blackhole) throws InterruptedException {
        ExecutorService executorService = Executors.newFixedThreadPool(reps);
        for (int i = 0; i < reps; i++) {
            executorService.execute(() -> {
                for (int j = 0; j < 10000; j++) {
                    atomicLong.getAndIncrement();
                }
            });
        }
        executorService.shutdown();
        while (!executorService.isTerminated()) {
            // 等待所有线程执行完毕
        }
        blackhole.consume(atomicLong);
    }

    @Benchmark
    public void BenchmarkConcurrencyCasInt64(Blackhole blackhole) throws InterruptedException {
        ExecutorService executorService = Executors.newFixedThreadPool(reps);
        for (int i = 0; i < reps; i++) {
            executorService.execute(() -> {
                for (int j = 0; j < 10000; j++) {
                    atomicLong.compareAndSet(1, 0);
                    atomicLong.compareAndSet(0, 1);
                }
            });
        }
        executorService.shutdown();
        while (!executorService.isTerminated()) {
            // 等待所有线程执行完毕
        }
        blackhole.consume(atomicLong);
    }

    @Benchmark
    public void BenchmarkConcurrencyLoadInt64(Blackhole blackhole) throws InterruptedException {
        ExecutorService executorService = Executors.newFixedThreadPool(reps);
        for (int i = 0; i < reps; i++) {
            executorService.execute(() -> {
                for (int j = 0; j < 10000; j++) {
                    atomicLong.get();
                }
            });
        }
        executorService.shutdown();
        while (!executorService.isTerminated()) {
            // 等待所有线程执行完毕
        }
        blackhole.consume(atomicLong);
    }

    @Benchmark
    public void BenchmarkConcurrencyStoreInt64(Blackhole blackhole) throws InterruptedException {
        ExecutorService executorService = Executors.newFixedThreadPool(reps);
        for (int i = 0; i < reps; i++) {
            executorService.execute(() -> {
                for (int j = 0; j < 10000; j++) {
                    atomicLong.set(0);
                }
            });
        }
        executorService.shutdown();
        while (!executorService.isTerminated()) {
            // 等待所有线程执行完毕
        }
        blackhole.consume(atomicLong);
    }

    @Benchmark
    public void BenchmarkConcurrencySubInt64(Blackhole blackhole) throws InterruptedException {
        ExecutorService executorService = Executors.newFixedThreadPool(reps);
        for (int i = 0; i < reps; i++) {
            executorService.execute(() -> {
                for (int j = 0; j < 10000; j++) {
                    atomicLong.decrementAndGet();
                }
            });
        }
        executorService.shutdown();
        while (!executorService.isTerminated()) {
            // 等待所有线程执行完毕
        }
        blackhole.consume(atomicLong);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkConcurrencyAtomicInt64.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
