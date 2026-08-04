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
public class BenchmarkRemoveFromHashMap {
    @Param(value = {"16", "128", "1024", "8192", "65536", "1048576"})
    static Integer size;
    static Double loadFactor = 0.7d;
    static HashMap<String, Integer> hashmap_String;
    static ArrayList<String> arr_String;

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
        hashmap_String = new HashMap<String, Integer>(mapSize);
        arr_String = new ArrayList<String>(mapSize);
        for (int i = 0; i < mapSize; i++) {
            StringBuilder str = makeString();
            // 同个对象会被缓存hashcode
            String str1 = str.toString();
            String str2 = str.toString();
            arr_String.add(str1);
            hashmap_String.put(str2, i);
        }
    }

    @Benchmark
    public void BenchmarkHashMapRemove() {
        for (String key: arr_String) {
            hashmap_String.remove(key);
        }
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkRemoveFromHashMap.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
