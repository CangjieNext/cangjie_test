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
public class BenchmarkTreeMap_contains {
    private TreeMap<Long, Long> mapInt64_16;
    private TreeMap<Long, Long> mapInt64_256;
    private TreeMap<Long, Long> mapInt64_2048;
    private TreeMap<Long, Long> mapInt64_16384;

    @Setup(Level.Invocation)
    public void setup() {
        mapInt64_16 = new TreeMap<Long, Long>();
        for (long i = 0; i < 16; i++) {
            mapInt64_16.put(i, i);
        }

        mapInt64_256 = new TreeMap<Long, Long>();
        for (long i = 0; i < 256; i++) {
            mapInt64_256.put(i, i);
        }

        mapInt64_2048 = new TreeMap<Long, Long>();
        for (long i = 0; i < 2048; i++) {
            mapInt64_2048.put(i, i);
        }

        mapInt64_16384 = new TreeMap<Long, Long>();
        for (long i = 0; i < 16384; i++) {
            mapInt64_16384.put(i, i);
        }
    }

    @Benchmark
    public void BenchmarkTreeMap_contains_Int64_N16(Blackhole blackhole) {
        boolean flag = mapInt64_16.containsKey(8L);
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeMap_contains_Int64_N256(Blackhole blackhole) {
        boolean flag = mapInt64_256.containsKey(128L);
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeMap_contains_Int64_N2048(Blackhole blackhole) {
        boolean flag = mapInt64_2048.containsKey(1024L);
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeMap_contains_Int64_N16384(Blackhole blackhole) {
        boolean flag = mapInt64_16384.containsKey(8192L);
        blackhole.consume(flag);
    }

    private TreeMap<String, Long> mapString_16;
    private TreeMap<String, Long> mapString_256;
    private TreeMap<String, Long> mapString_2048;
    private TreeMap<String, Long> mapString_16384;

    @Setup(Level.Invocation)
    public void setupStrings() {
        mapString_16 = new TreeMap<String, Long>();
        for (long i = 0; i < 16; i++) {
            mapString_16.put(String.valueOf(i), i);
        }

        mapString_256 = new TreeMap<String, Long>();
        for (long i = 0; i < 256; i++) {
            mapString_256.put(String.valueOf(i), i);
        }

        mapString_2048 = new TreeMap<String, Long>();
        for (long i = 0; i < 2048; i++) {
            mapString_2048.put(String.valueOf(i), i);
        }

        mapString_16384 = new TreeMap<String, Long>();
        for (long i = 0; i < 16384; i++) {
            mapString_16384.put(String.valueOf(i), i);
        }
    }

    @Benchmark
    public void BenchmarkTreeMap_contains_String_N16(Blackhole blackhole) {
        boolean flag = mapString_16.containsKey("8");
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeMap_contains_String_N256(Blackhole blackhole) {
        boolean flag = mapString_256.containsKey("128");
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeMap_contains_String_N2048(Blackhole blackhole) {
        boolean flag = mapString_2048.containsKey("1024");
        blackhole.consume(flag);
    }

    @Benchmark
    public void BenchmarkTreeMap_contains_String_N16384(Blackhole blackhole) {
        boolean flag = mapString_16384.containsKey("8192");
        blackhole.consume(flag);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeMap_contains.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
