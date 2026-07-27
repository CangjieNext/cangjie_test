/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// EXEC: %compiler %cmp_opt --test %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args --bench

package lambda;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.IntStream;
import java.util.stream.LongStream;
import java.util.*;

import java.util.ArrayList;
import java.util.concurrent.TimeUnit;

import static java.util.stream.Collectors.toCollection;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class TestLambdaWithCollections {
    interface L {
        int apply(int k);
    }

    @Param({"512", "1024", "2048", "4096"})
    public int reps;

    static long[] array;
    static ArrayList<Long> arrayList;

    @Setup(Level.Invocation)
    public void setUp() {
        array = new long[512];
        Arrays.setAll(array, i -> i);

        arrayList = new ArrayList<>();
        Random rand = new Random();
        rand.setSeed(System.currentTimeMillis());
        for (int i = 0; i < 512; i++) {
            arrayList.add(rand.nextLong());
        }
    }

    @Benchmark
    public long[] BenchmarkLambdaWithCollections_ArrayInit(TestLambdaWithCollections d) {
        long[] array = new long[d.reps];
        Arrays.setAll(array, i -> i * 2L);
        return array;
    }

    @Benchmark
    public ArrayList<Long> BenchmarkLambdaWithCollections_ArrayListInit(TestLambdaWithCollections d) {
        return LongStream.range(0, d.reps)
                .mapToObj(x -> 2 * x)
                .collect(Collectors.toCollection(ArrayList::new));
    }

    @Benchmark
    public long BenchmarkLambdaWithCollections_Reduce(TestLambdaWithCollections d) {
        return LongStream.of(d.array)
                .reduce(0L, (x, y) -> x + y);
    }

    @Benchmark
    public long BenchmarkLambdaWithCollections_FilterReduce(TestLambdaWithCollections d) {
        return LongStream.of(d.array)
                .filter(x -> x % 2 != 1)
                .reduce(0L, (x, y) -> x + y);
    }

    @Benchmark
    public long BenchmarkLambdaWithCollections_FilterMapReduce(TestLambdaWithCollections d) {
        return LongStream.of(d.array)
                .filter(x -> x % 2 != 1)
                .map(x -> 2 * x)
                .reduce(0L, (x, y) -> x + y);
    }

    @Benchmark
    public ArrayList<Long> BenchmarkLambdaWithCollections_SortBy(TestLambdaWithCollections d) {
        d.arrayList.sort( (x, y) -> {
            if (x == y) return 0;
            else if (x > y) return 1;
            else return -1;
        });
        return d.arrayList;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(TestLambdaWithCollections.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
