/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_hashmap;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.HashMap;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkHashmapClone {
    @Param(value = {"16", "128", "1024", "65536"})
    static int mapSize;

    static HashMap<Integer, Integer> hashMap;

    @Setup(Level.Iteration)
    public void setup() {
        hashMap = new HashMap<Integer, Integer>(mapSize);
        for (int i = 0; i < mapSize; i++) {
            hashMap.put(i, i);
        }
    }

    @Benchmark
    public Object BenchmarkHashMapClone_N() {
        return hashMap.clone();
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkHashmapClone.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
