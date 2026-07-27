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
public class BenchmarkHashmapPut {
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

    public String makeString() {
        String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder sb = new StringBuilder(100);
        Random random = new Random();
        for (int i = 0; i < 100; i++) {
            int index = random.nextInt(characters.length());
            sb.append(characters.charAt(index));
        }
        return sb.toString();
    }

    // Invocation级别的调用，防止java使用缓存
    @Setup(Level.Invocation)
    public void setup() {
        Random random = new Random();
        Integer mapSize = (int)(size * loadFactor);
        hashmap_Int64 = new HashMap<Integer, Integer>(mapSize);
        hashMap_Int64_0 = new HashMap<Integer, Integer>(16);
        hashmap_String = new HashMap<String, Integer>(mapSize);
        hashmap_String_0 = new HashMap<String, Integer>(16);
        hashmap_Float64 = new HashMap<Double, Integer>(mapSize);
        hashmap_Float64_0 = new HashMap<Double, Integer>(16);
        arr_Int64 = new ArrayList<Integer>(mapSize);
        arr_String = new ArrayList<String>(mapSize);
        arr_Float64 = new ArrayList<Double>(mapSize);
        for (int i = 0; i < mapSize; i++) {
            Integer randomNum = random.nextInt();
            arr_Int64.add(randomNum);
        }
        for (int i = 0; i < mapSize; i++) {
            String str = makeString();
            arr_String.add(str);
        }
        for (int i = 0; i < mapSize; i++) {
            Double randomNum = random.nextDouble();
            arr_Float64.add(randomNum);
        }
    }

    @Benchmark
    public HashMap<Integer, Integer> BenchmarkHashMapPut_Int64() {
        for (Integer key: arr_Int64) {
            hashmap_Int64.put(key, 0);
        }
        return hashmap_Int64;
    }

    @Benchmark
    public HashMap<Integer, Integer> BenchmarkHashMapPut_Int64_Reserve() {
        for (Integer key: arr_Int64) {
            hashMap_Int64_0.put(key, 0);
        }
        return hashMap_Int64_0;
    }

    @Benchmark
    public HashMap<String, Integer> BenchmarkHashMapPut_String() {
        for (String key: arr_String) {
            hashmap_String.put(key, 0);
        }
        return hashmap_String;
    }

    @Benchmark
    public HashMap<String, Integer> BenchmarkHashMapPut_String_Reserve() {
        for (String key: arr_String) {
            hashmap_String_0.put(key, 0);
        }
        return hashmap_String_0;
    }

    @Benchmark
    public HashMap<Double, Integer> BenchmarkHashMapPut_Float64() {
        for (Double key: arr_Float64) {
            hashmap_Float64.put(key, 0);
        }
        return hashmap_Float64;
    }

    @Benchmark
    public HashMap<Double, Integer> BenchmarkHashMapPut_Float64_Reserve() {
        for (Double key: arr_Float64) {
            hashmap_Float64_0.put(key, 0);
        }
        return hashmap_Float64_0;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkHashmapPut.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
