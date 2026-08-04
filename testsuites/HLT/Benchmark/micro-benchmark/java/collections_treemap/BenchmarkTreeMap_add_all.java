/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_treemap;

import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;
import org.openjdk.jmh.annotations.*;

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
public class BenchmarkTreeMap_add_all {
    protected static class DataHolder {
        public static final Map<Long, Long> LONG_MAP_16 = generateLongMap(16);
        public static final Map<Long, Long> LONG_MAP_256 = generateLongMap(256);
        public static final Map<Long, Long> LONG_MAP_4096 = generateLongMap(4096);

        public static final Map<String, Long> STRING_MAP_16 = generateStringMap(16);
        public static final Map<String, Long> STRING_MAP_256 = generateStringMap(256);
        public static final Map<String, Long> STRING_MAP_4096 = generateStringMap(4096);

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

    TreeMap<Long, Long> treeMap_Int64 = new TreeMap<Long, Long>();
    TreeMap<String, Long> treeMap_String = new TreeMap<String, Long>();

    @Setup(Level.Invocation)
    public void setup() {
        treeMap_Int64 = new TreeMap<Long, Long>();
        treeMap_String = new TreeMap<String, Long>();
    }

    @Benchmark
    public void BenchmarkTreeMap_add_all_Int64_N16() {
        treeMap_Int64.putAll(DataHolder.LONG_MAP_16);
    }

    @Benchmark
    public void BenchmarkTreeMap_add_all_Int64_N256() {
        treeMap_Int64.putAll(DataHolder.LONG_MAP_256);
    }

    @Benchmark
    public void BenchmarkTreeMap_add_all_Int64_N4096() {
        treeMap_Int64.putAll(DataHolder.LONG_MAP_4096);
    }

    @Benchmark
    public void BenchmarkTreeMap_add_all_String_N16() {
        treeMap_String.putAll(DataHolder.STRING_MAP_16);
    }

    @Benchmark
    public void BenchmarkTreeMap_add_all_String_N256() {
        treeMap_String.putAll(DataHolder.STRING_MAP_256);
    }

    @Benchmark
    public void BenchmarkTreeMap_add_all_String_N4096() {
        treeMap_String.putAll(DataHolder.STRING_MAP_4096);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeMap_add_all.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
