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
public class BenchmarkArrayListRemove {
    ArrayList<Integer> arrayList_Int64 = new ArrayList<Integer>(256);
    ArrayList<String> arrayList_String = new ArrayList<String>(256);

    @Setup(Level.Invocation)
    public void setup() {
        arrayList_Int64 = new ArrayList<Integer>(256);
        arrayList_String = new ArrayList<String>(256);
        for (int i = 0; i < 256; i++) {
            arrayList_Int64.add(i);
        }
        for (int i = 0; i < 256; i++) {
            arrayList_String.add("a");
        }
    }

    @Benchmark
    public void BenchmarkArrayListRemove_Int64_start() {
        arrayList_Int64.remove(0);
    }

    @Benchmark
    public void BenchmarkArrayListRemove_Int64_mid() {
        arrayList_Int64.remove(128);
    }

    @Benchmark
    public void BenchmarkArrayListRemove_Int64_end() {
        arrayList_Int64.remove(255);
    }

    @Benchmark
    public void BenchmarkArrayListRemove_String_start() {
        arrayList_String.remove(0);
    }

    @Benchmark
    public void BenchmarkArrayListRemove_String_mid() {
        arrayList_String.remove(128);
    }

    @Benchmark
    public void BenchmarkArrayListRemove_String_end() {
        arrayList_String.remove(255);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListRemove.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
