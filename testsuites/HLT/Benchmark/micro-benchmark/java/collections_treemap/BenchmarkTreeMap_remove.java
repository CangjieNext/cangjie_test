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
public class BenchmarkTreeMap_remove {
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
    public void BenchmarkTreeMap_remove_Int64_N16(Blackhole blackhole) {
        blackhole.consume(mapInt64_16.remove(8L));
    }

    @Benchmark
    public void BenchmarkTreeMap_remove_nonexist_Int64_N16(Blackhole blackhole) {
        blackhole.consume(mapInt64_16.remove(1024L));
    }

    @Benchmark
    public void BenchmarkTreeMap_remove_String_N16(Blackhole blackhole) {
        blackhole.consume(mapString_16.remove("8"));
    }

    @Benchmark
    public void BenchmarkTreeMap_remove_nonexist_String_N16(Blackhole blackhole) {
        blackhole.consume(mapString_16.remove("80"));
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeMap_remove.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
