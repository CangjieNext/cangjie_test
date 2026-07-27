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
public class BenchmarkTreeMap_get {
    private TreeMap<Long, Long> mapInt64_16;
    private TreeMap<Long, Long> mapInt64_256;
    private TreeMap<Long, Long> mapInt64_2048;
    private TreeMap<Long, Long> mapInt64_16384;

    @Setup(Level.Invocation)
    public void setupInt64() {
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
    public void BenchmarkTreeMap_get_Int64_N16_p1(Blackhole blackhole) {
        Long value = mapInt64_16.get(0L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N16_p2(Blackhole blackhole) {
        Long value = mapInt64_16.get(7L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N16_p3(Blackhole blackhole) {
        Long value = mapInt64_16.get(15L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N256_p1(Blackhole blackhole) {
        Long value = mapInt64_256.get(0L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N256_p2(Blackhole blackhole) {
        Long value = mapInt64_256.get(127L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N256_p3(Blackhole blackhole) {
        Long value = mapInt64_256.get(255L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N2048_p1(Blackhole blackhole) {
        Long value = mapInt64_2048.get(0L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N2048_p2(Blackhole blackhole) {
        Long value = mapInt64_2048.get(1023L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N2048_p3(Blackhole blackhole) {
        Long value = mapInt64_2048.get(2047L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N16384_p1(Blackhole blackhole) {
        Long value = mapInt64_16384.get(0L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N16384_p2(Blackhole blackhole) {
        Long value = mapInt64_16384.get(8191L);
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_Int64_N16384_p3(Blackhole blackhole) {
        Long value = mapInt64_16384.get(16383L);
        blackhole.consume(value);
    }

    private TreeMap<String, Long> mapString_16;
    private TreeMap<String, Long> mapString_256;
    private TreeMap<String, Long> mapString_2048;
    private TreeMap<String, Long> mapString_16384;

    @Setup(Level.Invocation)
    public void setupString() {
        mapString_16 = new TreeMap<String, Long>();
        for (int i = 0; i < 16; i++) {
            mapString_16.put(String.valueOf(i), (long) i);
        }
        mapString_256 = new TreeMap<String, Long>();
        for (int i = 0; i < 256; i++) {
            mapString_256.put(String.valueOf(i), (long) i);
        }
        mapString_2048 = new TreeMap<String, Long>();
        for (int i = 0; i < 2048; i++) {
            mapString_2048.put(String.valueOf(i), (long) i);
        }
        mapString_16384 = new TreeMap<String, Long>();
        for (int i = 0; i < 16384; i++) {
            mapString_16384.put(String.valueOf(i), (long) i);
        }
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N16_p1(Blackhole blackhole) {
        Long value = mapString_16.get("0");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N16_p2(Blackhole blackhole) {
        Long value = mapString_16.get("7");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N16_p3(Blackhole blackhole) {
        Long value = mapString_16.get("15");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N256_p1(Blackhole blackhole) {
        Long value = mapString_256.get("0");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N256_p2(Blackhole blackhole) {
        Long value = mapString_256.get("127");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N256_p3(Blackhole blackhole) {
        Long value = mapString_256.get("255");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N2048_p1(Blackhole blackhole) {
        Long value = mapString_2048.get("0");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N2048_p2(Blackhole blackhole) {
        Long value = mapString_2048.get("1023");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N2048_p3(Blackhole blackhole) {
        Long value = mapString_2048.get("2047");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N16384_p1(Blackhole blackhole) {
        Long value = mapString_16384.get("0");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N16384_p2(Blackhole blackhole) {
        Long value = mapString_16384.get("8191");
        blackhole.consume(value);
    }

    @Benchmark
    public void BenchmarkTreeMap_get_String_N16384_p3(Blackhole blackhole) {
        Long value = mapString_16384.get("16383");
        blackhole.consume(value);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeMap_get.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
