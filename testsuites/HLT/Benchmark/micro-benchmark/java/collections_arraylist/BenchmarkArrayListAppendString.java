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
public class BenchmarkArrayListAppendString {
    static ArrayList<String> arrayList;
    static String str_8   = new String(new int [8], 0, 8).replace('\0', 'H');
    static String str_64   = new String(new int [64], 0, 64).replace('\0', 'H');
    static String str_512   = new String(new int [512], 0, 512).replace('\0', 'H');
    static String str_4096   = new String(new int [4096], 0, 4096).replace('\0', 'H');

    @Setup(Level.Invocation)
    public void setupArray() {
        arrayList = new ArrayList<String>();
    }

    @Benchmark
    public ArrayList<String> BenchmarkArrayListAppendString_N8() {
        arrayList.add(str_8);
        return arrayList;
    }

    @Benchmark
    public ArrayList<String> BenchmarkArrayListAppendString_N64() {
        arrayList.add(str_64);
        return arrayList;
    }

    @Benchmark
    public ArrayList<String> BenchmarkArrayListAppendString_N512() {
        arrayList.add(str_512);
        return arrayList;
    }

    @Benchmark
    public ArrayList<String> BenchmarkArrayListAppendString_N4096() {
        arrayList.add(str_4096);
        return arrayList;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListAppendString.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
