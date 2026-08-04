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

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Random;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkHashmapContains {
    @Param(value = {"16", "128", "1024", "8192", "65536", "1048576"})
    static Integer size;
    static Double loadFactor = 0.7d;
    static HashMap<Integer, Integer> hashmap_Int64;
    static HashMap<Integer, Integer> hashMap_Int64_0;
    static HashMap<String, Integer> hashmap_String;
    static HashMap<String, Integer> hashmap_String_0;
    static HashMap<Double, Integer> hashmap_Float64;
    static HashMap<Double, Integer> hashmap_Float64_0;
    static ArrayList<Integer> arr_Int64;
    static ArrayList<String> arr_String;
    static ArrayList<Double> arr_Float64;
    static Boolean bool;
    static Integer element_Int64;

    public StringBuilder makeString() {
        String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder sb = new StringBuilder(100);
        Random random = new Random();
        for (int i = 0; i < 100; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }
        return sb;
    }

    // Invocation级别的调用，防止java使用缓存
    @Setup(Level.Invocation)
    public void setup() {
        Random random = new Random();
        Integer mapSize = (int)(size * loadFactor);
        hashmap_Int64 = new HashMap<Integer, Integer>(mapSize);
        hashMap_Int64_0 = new HashMap<Integer, Integer>(mapSize);
        hashmap_String = new HashMap<String, Integer>(mapSize);
        hashmap_String_0 = new HashMap<String, Integer>(mapSize);
        hashmap_Float64 = new HashMap<Double, Integer>(mapSize);
        hashmap_Float64_0 = new HashMap<Double, Integer>(mapSize);
        arr_Int64 = new ArrayList<Integer>(mapSize);
        arr_String = new ArrayList<String>(mapSize);
        arr_Float64 = new ArrayList<Double>(mapSize);
        for (int i = 0; i < mapSize; i++) {
            Integer randomNum = random.nextInt();
            arr_Int64.add(randomNum);
            hashmap_Int64.put(randomNum, i);
        }
        for (int i = 0; i < mapSize; i++) {
            hashMap_Int64_0.put(random.nextInt(), i);
        }
        for (int i = 0; i < mapSize; i++) {
            StringBuilder str = makeString();
            // 同个对象会被缓存hashcode
            String str1 = str.toString();
            String str2 = str.toString();
            arr_String.add(str1);
            hashmap_String.put(str2, i);
        }
        for (int i = 0; i < mapSize; i++) {
            String str = makeString().toString();
            hashmap_String_0.put(str, i);
        }
        for (int i = 0; i < mapSize; i++) {
            Double randomNum = random.nextDouble();
            arr_Float64.add(randomNum);
            hashmap_Float64.put(randomNum, i);
        }
        for (int i = 0; i < mapSize; i++) {
            hashmap_Float64_0.put(random.nextDouble(), i);
        }
    }

    @Benchmark
    public void BenchmarkHashMapContains_Int64() {
        for (Integer key: arr_Int64) {
            bool = hashmap_Int64.containsKey(key);
        }
    }

    @Benchmark
    public void BenchmarkHashMapContains_Int64_NonExist() {
        for (Integer key: arr_Int64) {
            bool = hashMap_Int64_0.containsKey(key);
        }
    }

    @Benchmark
    public void BenchmarkHashMapContains_String() {
        for (String key: arr_String) {
            bool = hashmap_String.containsKey(key);
        }
    }

    @Benchmark
    public void BenchmarkHashMapContains_String_NonExist() {
        for (String key: arr_String) {
            bool = hashmap_String_0.containsKey(key);
        }
    }

    @Benchmark
    public void BenchmarkHashMapContains_Float64() {
        for (Double key: arr_Float64) {
            bool = hashmap_Float64.containsKey(key);
        }
    }

    @Benchmark
    public void BenchmarkHashMapContains_Float64_NonExist() {
        for (Double key: arr_Float64) {
            bool = hashmap_Float64_0.containsKey(key);
        }
    }

    @Benchmark
    public void BenchmarkHashMapGet_Int64() {
        for (Integer key: arr_Int64) {
            element_Int64 = hashmap_Int64.get(key);
        }
    }

    @Benchmark
    public void BenchmarkHashMapGet_String() {
        for (String key: arr_String) {
            element_Int64 = hashmap_String.get(key);
        }
    }

    @Benchmark
    public void BenchmarkHashMapGet_Float64() {
        for (Double key: arr_Float64) {
            element_Int64 = hashmap_Float64.get(key);
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkHashmapContains.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
