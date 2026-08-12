/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_treemap;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.TreeMap;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkTreeMap_clear {
    private TreeMap<Long, Long> mapInt64_16;
    private TreeMap<String, Long> mapString_16;

    @Setup(Level.Invocation)
    public void setup() {
        mapInt64_16 = new TreeMap<Long, Long>();
        for (long i = 0; i < 16; i++) {
            mapInt64_16.put(i, i);
        }
        mapString_16 = new TreeMap<String, Long>();
        for (long i = 0; i < 16; i++) {
            mapString_16.put(String.valueOf(i), i);
        }
    }

    @Benchmark
    public void BenchmarkTreeMap_clear_Int64_N16(Blackhole blackhole) {
        mapInt64_16.clear();
    }

    @Benchmark
    public void BenchmarkTreeMap_clear_String_N16(Blackhole blackhole) {
        mapString_16.clear();
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeMap_clear.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
