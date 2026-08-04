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
public class BenchmarkArrayListInitCapacity {
    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitCapacity_N16() {
        return  new ArrayList<Integer>(16);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitCapacity_N128() {
        return  new ArrayList<Integer>(128);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitCapacity_N1024() {
        return  new ArrayList<Integer>(1024);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitCapacity_N8192() {
        return  new ArrayList<Integer>(8192);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitCapacity_N65536() {
        return  new ArrayList<Integer>(65536);
    }

    @Benchmark
    public ArrayList<Integer> BenchmarkArrayListInitCapacity_N1048576() {
        return  new ArrayList<Integer>(1048576);
    }


    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayListInitCapacity.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
