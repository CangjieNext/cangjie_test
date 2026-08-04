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

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkTreeMap_Init {
    // 静态数据提供类，在类加载时初始化所有测试数据
    protected static class DataHolder {
        public static final Map<Long, Long> LONG_MAP_16 = generateLongMap(16);
        public static final Map<Long, Long> LONG_MAP_256 = generateLongMap(256);
        public static final Map<Long, Long> LONG_MAP_2048 = generateLongMap(2048);
        public static final Map<Long, Long> LONG_MAP_16384 = generateLongMap(16384);
        public static final Map<Long, Long> LONG_MAP_131072 = generateLongMap(131072);
        public static final Map<Long, Long> LONG_MAP_1048576 = generateLongMap(1048576);

        public static final Map<String, Long> STRING_MAP_16 = generateStringMap(16);
        public static final Map<String, Long> STRING_MAP_256 = generateStringMap(256);
        public static final Map<String, Long> STRING_MAP_2048 = generateStringMap(2048);
        public static final Map<String, Long> STRING_MAP_16384 = generateStringMap(16384);
        public static final Map<String, Long> STRING_MAP_131072 = generateStringMap(131072);
        public static final Map<String, Long> STRING_MAP_1048576 = generateStringMap(1048576);

        private static Map<Long, Long> generateLongMap(int size) {
            Map<Long, Long> map = new HashMap<Long, Long>();
            for (long i = 0; i < size; i++) {
                map.put(i, i);
            }
            return Collections.unmodifiableMap(map);
        }

        private static Map<String, Long> generateStringMap(int size) {
            Map<String, Long> map = new HashMap<String, Long>();
            for (long i = 0; i < size; i++) {
                map.put(Long.toString(i), i);
            }
            return Collections.unmodifiableMap(map);
        }
    }

    // Long键类型测试组
    @Benchmark
    public void BenchmarkTreeMap_Init_Int64_N16(Blackhole bh) {
        TreeMap<Long, Long> treeMap = new TreeMap<Long, Long>(DataHolder.LONG_MAP_16);
        bh.consume(treeMap);
    }

    @Benchmark
    public void BenchmarkTreeMap_Init_Int64_N256(Blackhole bh) {
        TreeMap<Long, Long> treeMap = new TreeMap<Long, Long>(DataHolder.LONG_MAP_256);
        bh.consume(treeMap);
    }

    @Benchmark
    public void BenchmarkTreeMap_Init_Int64_N2048(Blackhole bh) {
        TreeMap<Long, Long> treeMap = new TreeMap<Long, Long>(DataHolder.LONG_MAP_2048);
        bh.consume(treeMap);
    }

    @Benchmark
    public void BenchmarkTreeMap_Init_Int64_N16384(Blackhole bh) {
        TreeMap<Long, Long> treeMap = new TreeMap<Long, Long>(DataHolder.LONG_MAP_16384);
        bh.consume(treeMap);
    }

    @Benchmark
    public void BenchmarkTreeMap_Init_Int64_N131072(Blackhole bh) {
        TreeMap<Long, Long> treeMap = new TreeMap<Long, Long>(DataHolder.LONG_MAP_131072);
        bh.consume(treeMap);
    }

    @Benchmark
    public void BenchmarkTreeMap_Init_Int64_N1048576(Blackhole bh) {
        TreeMap<Long, Long> treeMap = new TreeMap<Long, Long>(DataHolder.LONG_MAP_1048576);
        bh.consume(treeMap);
    }

    // String键类型测试组
    @Benchmark
    public void BenchmarkTreeMap_Init_String_N16(Blackhole bh) {
        TreeMap<String, Long> treeMap = new TreeMap<String, Long>(DataHolder.STRING_MAP_16);
        bh.consume(treeMap);
    }

    @Benchmark
    public void BenchmarkTreeMap_Init_String_N256(Blackhole bh) {
        TreeMap<String, Long> treeMap = new TreeMap<String, Long>(DataHolder.STRING_MAP_256);
        bh.consume(treeMap);
    }

    @Benchmark
    public void BenchmarkTreeMap_Init_String_N2048(Blackhole bh) {
        TreeMap<String, Long> treeMap = new TreeMap<String, Long>(DataHolder.STRING_MAP_2048);
        bh.consume(treeMap);
    }

    @Benchmark
    public void BenchmarkTreeMap_Init_String_N16384(Blackhole bh) {
        TreeMap<String, Long> treeMap = new TreeMap<String, Long>(DataHolder.STRING_MAP_16384);
        bh.consume(treeMap);
    }

    @Benchmark
    public void BenchmarkTreeMap_Init_String_N131072(Blackhole bh) {
        TreeMap<String, Long> treeMap = new TreeMap<String, Long>(DataHolder.STRING_MAP_131072);
        bh.consume(treeMap);
    }

    @Benchmark
    public void BenchmarkTreeMap_Init_String_N1048576(Blackhole bh) {
        TreeMap<String, Long> treeMap = new TreeMap<String, Long>(DataHolder.STRING_MAP_1048576);
        bh.consume(treeMap);
    }
    
    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeMap_Init.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
