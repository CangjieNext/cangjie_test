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
public class BenchmarkHashmapInit {
    @Param(value = {"16", "128", "1024", "8192", "65536", "1048576"})
    static int mapSize;

    @Benchmark
    public HashMap<Integer, Integer> BenchmarkHashMapInitCapacity_Int64_N() {
        HashMap<Integer, Integer> hashMap = new HashMap<Integer, Integer>(mapSize);
        hashMap.put(1, 1);
        return hashMap;
    }

    @Benchmark
    public HashMap<String, Integer> BenchmarkHashMapInitCapacity_String_N() {
        HashMap<String, Integer> hashMap = new HashMap<String, Integer>(mapSize);
        hashMap.put("1", 1);
        return hashMap;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkHashmapInit.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
