/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_treeset;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.ArrayList;
import java.util.TreeSet;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkTreeSet_add_all {
    private TreeSet<Long> emptySet_N16;
    private ArrayList<Long> list_N16;

    private TreeSet<Long> emptySet_N256;
    private ArrayList<Long> list_N256;

    private TreeSet<Long> emptySet_N4096;
    private ArrayList<Long> list_N4096;

    // reserve 版本：使用 x - x % 2 生成偶数序列（有重复）
    private TreeSet<Long> emptySet_N16_reserve;
    private ArrayList<Long> list_N16_reserve;

    private TreeSet<Long> emptySet_N256_reserve;
    private ArrayList<Long> list_N256_reserve;

    private TreeSet<Long> emptySet_N4096_reserve;
    private ArrayList<Long> list_N4096_reserve;

    @Setup(Level.Invocation)
    public void setup() {
        int[] sizes = {16, 256, 4096};

        for (int size : sizes) {
            // 正常序列：0, 1, 2, ..., size-1
            ArrayList<Long> normalList = new ArrayList<Long>();
            for (long i = 0; i < size; i++) {
                normalList.add(i);
            }

            // reserve 序列：x - x % 2 → 只保留偶数
            ArrayList<Long> reserveList = new ArrayList<Long>();
            for (long i = 0; i < size; i++) {
                reserveList.add(i - (i % 2));
            }

            TreeSet<Long> emptySet = new TreeSet<Long>();
            switch (size) {
                case 16:
                    emptySet_N16 = emptySet;
                    list_N16 = normalList;
                    emptySet_N16_reserve = new TreeSet<Long>();
                    list_N16_reserve = reserveList;
                    break;
                case 256:
                    emptySet_N256 = emptySet;
                    list_N256 = normalList;
                    emptySet_N256_reserve = new TreeSet<Long>();
                    list_N256_reserve = reserveList;
                    break;
                case 4096:
                    emptySet_N4096 = emptySet;
                    list_N4096 = normalList;
                    emptySet_N4096_reserve = new TreeSet<Long>();
                    list_N4096_reserve = reserveList;
                    break;
            }
        }
    }

    @Benchmark
    public void BenchmarkTreeSet_add_all_Int64_N16(Blackhole blackhole) {
        TreeSet<Long> treeset = emptySet_N16;
        ArrayList<Long> arr = list_N16;
        treeset.addAll(arr);
        blackhole.consume(treeset);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_all_Int64_N256(Blackhole blackhole) {
        TreeSet<Long> treeset = emptySet_N256;
        ArrayList<Long> arr = list_N256;
        treeset.addAll(arr);
        blackhole.consume(treeset);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_all_Int64_N4096(Blackhole blackhole) {
        TreeSet<Long> treeset = emptySet_N4096;
        ArrayList<Long> arr = list_N4096;
        treeset.addAll(arr);
        blackhole.consume(treeset);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_all_Int64_N16_reserve(Blackhole blackhole) {
        TreeSet<Long> treeset = emptySet_N16_reserve;
        ArrayList<Long> arr = list_N16_reserve;
        treeset.addAll(arr);
        blackhole.consume(treeset);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_all_Int64_N256_reserve(Blackhole blackhole) {
        TreeSet<Long> treeset = emptySet_N256_reserve;
        ArrayList<Long> arr = list_N256_reserve;
        treeset.addAll(arr);
        blackhole.consume(treeset);
    }

    @Benchmark
    public void BenchmarkTreeSet_add_all_Int64_N4096_reserve(Blackhole blackhole) {
        TreeSet<Long> treeset = emptySet_N4096_reserve;
        ArrayList<Long> arr = list_N4096_reserve;
        treeset.addAll(arr);
        blackhole.consume(treeset);
    }
    
    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeSet_add_all.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
