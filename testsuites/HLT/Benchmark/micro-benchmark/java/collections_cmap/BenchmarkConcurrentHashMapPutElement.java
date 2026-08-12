/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_cmap;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkConcurrentHashMapPutElement {
    @Param(value = {"4", "8", "16", "32", "256", "1024"})
    static int thread;

    @Benchmark
    public void BenchmarkCHM_PutElement_Thread() throws InterruptedException {
        ThreadLocal<ConcurrentHashMap<Integer, Integer>> mapThreadLocal = ThreadLocal.withInitial(ConcurrentHashMap::new);
        try {
            List<Thread> threadList = new ArrayList<Thread>();
            Random random = new Random();
            for (int i = 0; i < thread; i++) {
                Thread thread = new Thread(() -> {
                    ConcurrentHashMap<Integer, Integer> concurrentHashMap = mapThreadLocal.get();
                    for (int j = 0; j < 10000; j++) {
                        concurrentHashMap.put(random.nextInt(), j);
                    }
                });
                threadList.add(thread);
                thread.start();
            }
            for (Thread thread : threadList) {
                thread.join();
            }
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkConcurrentHashMapPutElement.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
