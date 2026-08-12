/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_arraylist;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArrayListInsert {
    static ArrayList<Integer> arr_int_16 = new ArrayList<Integer>(16);
    static ArrayList<Integer> arr_int_256 = new ArrayList<Integer>(256);
    static ArrayList<Integer> arr_int_131072 = new ArrayList<Integer>(131072);
    static ArrayList<String> arr_str_16 = new ArrayList<String>(16);
    static ArrayList<String> arr_str_256 = new ArrayList<String>(256);
    static ArrayList<String> arr_str_131072 = new ArrayList<String>(131072);

    public ArrayList<Integer> makeArrayInt(ArrayList<Integer> arrayList, Integer size) {
        arrayList = new ArrayList<Integer>(size);
        for (int i = 0; i < size; i++) {
            arrayList.add(i);
        }
        return arrayList;
    }

    public ArrayList<String> makeArrayString(ArrayList<String> arrayList, Integer size) {
        arrayList = new ArrayList<String>(size);
        for (int i = 0; i < size; i++) {
            arrayList.add(String.valueOf(i));
        }
        return arrayList;
    }

    @Setup(Level.Invocation)
    public void setup() {
        arr_int_16 = makeArrayInt(arr_int_16, 16);
        arr_int_256 = makeArrayInt(arr_int_256, 256);
        arr_int_131072 = makeArrayInt(arr_int_131072, 131072);
        arr_str_16 = makeArrayString(arr_str_16, 16);
        arr_str_256 = makeArrayString(arr_str_256, 256);
        arr_str_131072 = makeArrayString(arr_str_131072, 131072);
    }

    @Benchmark
    public void BenchmarkArrayListInsert_Int64_N16_start() {
        arr_int_16.add(0, 888);
    }

    @Benchmark
    public void BenchmarkArrayListInsert_Int64_N16_mid() {
        arr_int_16.add(8, 888);
    }

    @Benchmark
    public void BenchmarkArrayListInsert_Int64_N16_end() {
        arr_int_16.add(16, 888);
    }

    @Benchmark
    public void BenchmarkArrayListInsert_Int64_N256_start() {
        arr_int_256.add(0, 888);
    }

    @Benchmark
    public void BenchmarkArrayListInsert_Int64_N256_mid() {
        arr_int_256.add(128, 888);
    }

    @Benchmark
    public void BenchmarkArrayListInsert_Int64_N256_end() {
        arr_int_256.add(256, 888);
    }

    @Benchmark
    public void BenchmarkArrayListInsert_Int64_N131072_start() {
        arr_int_131072.add(0, 888);
    }

    @Benchmark
    public void BenchmarkArrayListInsert_Int64_N131072_mid() {
        arr_int_131072.add(65536, 888);
    }

    @Benchmark
    public void BenchmarkArrayListInsert_Int64_N131072_end() {
        arr_int_131072.add(131072, 888);
    }

    @Benchmark
    public void BenchmarkArrayListInsert_String_N16_start() {
        arr_str_16.add(0, "a");
    }

    @Benchmark
    public void BenchmarkArrayListInsert_String_N16_mid() {
        arr_str_16.add(8, "a");
    }

    @Benchmark
    public void BenchmarkArrayListInsert_String_N16_end() {
        arr_str_16.add(16, "a");
    }

    @Benchmark
    public void BenchmarkArrayListInsert_String_N256_start() {
        arr_str_256.add(0, "a");
    }

    @Benchmark
    public void BenchmarkArrayListInsert_String_N256_mid() {
        arr_str_256.add(128, "a");
    }

    @Benchmark
    public void BenchmarkArrayListInsert_String_N256_end() {
        arr_str_256.add(256, "a");
    }

    @Benchmark
    public void BenchmarkArrayListInsert_String_N131072_start() {
        arr_str_131072.add(0, "a");
    }

    @Benchmark
    public void BenchmarkArrayListInsert_String_N131072_mid() {
        arr_str_131072.add(65536, "a");
    }

    @Benchmark
    public void BenchmarkArrayListInsert_String_N131072_end() {
        arr_str_131072.add(131072, "a");
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListInsert.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
