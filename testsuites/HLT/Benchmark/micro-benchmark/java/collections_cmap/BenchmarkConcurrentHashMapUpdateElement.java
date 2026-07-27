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

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkConcurrentHashMapUpdateElement {
    @Param(value = {"4", "8", "16", "32", "256", "1024"})
    static int thread;

    static int ops = 1024 * 1024 * 16;

    @Benchmark
    public void BenchmarkCHM_UpdateElement_Thread() throws InterruptedException {
        ThreadLocal<ConcurrentHashMap<Integer, Integer>> threadLocalMap = ThreadLocal.withInitial(ConcurrentHashMap::new);
        try {
            for (int i = 0; i < thread; i++) {
                int finalI = i;
                new Thread(() -> {
                    ConcurrentHashMap<Integer, Integer> concurrentHashMap = threadLocalMap.get();
                    Integer k = (finalI + 1573) & 127;
                    for (int j = 0; j < ops / thread; j++) {
                        Object value = concurrentHashMap.putIfAbsent(k, 1);
                        if (value != null) {
                            concurrentHashMap.replace(k, k + j + 1);
                        }
                        k = (k + 7) & 127;
                    }
                }).start();
            }
            Thread.sleep(1000);
        } finally {
            threadLocalMap.remove();
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkConcurrentHashMapUpdateElement.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
