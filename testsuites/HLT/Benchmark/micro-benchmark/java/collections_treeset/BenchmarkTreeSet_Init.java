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
import java.util.List;
import java.util.TreeSet;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkTreeSet_Init {
    // 用于存储不同规模的 Long 列表（正常递增）
    private List<Long> dataN16;
    private List<Long> dataN256;
    private List<Long> dataN2048;
    private List<Long> dataN16384;
    private List<Long> dataN131072;

    // 用于存储不同规模的 Long 列表（偶数：x - x % 2）
    private List<Long> dataN16_reserve;
    private List<Long> dataN256_reserve;
    private List<Long> dataN2048_reserve;
    private List<Long> dataN16384_reserve;
    private List<Long> dataN131072_reserve;

    // 用于存储 String 列表（正常递增字符串）
    private List<String> stringDataN16;
    private List<String> stringDataN256;
    private List<String> stringDataN2048;
    private List<String> stringDataN16384;
    private List<String> stringDataN131072;

    // 用于存储 String 列表（偶数字符串）
    private List<String> stringDataN16_reserve;
    private List<String> stringDataN256_reserve;
    private List<String> stringDataN2048_reserve;
    private List<String> stringDataN16384_reserve;
    private List<String> stringDataN131072_reserve;

    @Setup(Level.Invocation)
    public void setup() {
        int[] sizes = {16, 256, 2048, 16384, 131072};

        for (int size : sizes) {
            List<Long> normal = new ArrayList<Long>();
            List<Long> reserve = new ArrayList<Long>();

            for (long i = 0; i < size; i++) {
                normal.add(i);
                reserve.add(i - (i % 2));
            }

            switch (size) {
                case 16:
                    dataN16 = normal;
                    dataN16_reserve = reserve;
                    break;
                case 256:
                    dataN256 = normal;
                    dataN256_reserve = reserve;
                    break;
                case 2048:
                    dataN2048 = normal;
                    dataN2048_reserve = reserve;
                    break;
                case 16384:
                    dataN16384 = normal;
                    dataN16384_reserve = reserve;
                    break;
                case 131072:
                    dataN131072 = normal;
                    dataN131072_reserve = reserve;
                    break;
            }
        }

        // 生成 String 数据
        for (int size : sizes) {
            List<String> normal = new ArrayList<String>();
            List<String> reserve = new ArrayList<String>();

            for (long i = 0; i < size; i++) {
                normal.add(String.valueOf(i));
                reserve.add(String.valueOf(i - (i % 2)));
            }

            switch (size) {
                case 16:
                    stringDataN16 = normal;
                    stringDataN16_reserve = reserve;
                    break;
                case 256:
                    stringDataN256 = normal;
                    stringDataN256_reserve = reserve;
                    break;
                case 2048:
                    stringDataN2048 = normal;
                    stringDataN2048_reserve = reserve;
                    break;
                case 16384:
                    stringDataN16384 = normal;
                    stringDataN16384_reserve = reserve;
                    break;
                case 131072:
                    stringDataN131072 = normal;
                    stringDataN131072_reserve = reserve;
                    break;
            }
        }
    }

    // ================== Long Tests ==================

    @Benchmark
    public void BenchmarkTreeSet_Init_Int64_N16(Blackhole blackhole) {
        TreeSet<Long> treesets = new TreeSet<Long>(dataN16);
        blackhole.consume(treesets); // 模拟 blackBox
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_Int64_N256(Blackhole blackhole) {
        TreeSet<Long> treesets = new TreeSet<Long>(dataN256);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_Int64_N2048(Blackhole blackhole) {
        TreeSet<Long> treesets = new TreeSet<Long>(dataN2048);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_Int64_N16384(Blackhole blackhole) {
        TreeSet<Long> treesets = new TreeSet<Long>(dataN16384);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_Int64_N131072(Blackhole blackhole) {
        TreeSet<Long> treesets = new TreeSet<Long>(dataN131072);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_Int64_N16_reserve(Blackhole blackhole) {
        TreeSet<Long> treesets = new TreeSet<Long>(dataN16_reserve);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_Int64_N256_reserve(Blackhole blackhole) {
        TreeSet<Long> treesets = new TreeSet<Long>(dataN256_reserve);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_Int64_N2048_reserve(Blackhole blackhole) {
        TreeSet<Long> treesets = new TreeSet<Long>(dataN2048_reserve);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_Int64_N16384_reserve(Blackhole blackhole) {
        TreeSet<Long> treesets = new TreeSet<Long>(dataN16384_reserve);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_Int64_N131072_reserve(Blackhole blackhole) {
        TreeSet<Long> treesets = new TreeSet<Long>(dataN131072_reserve);
        blackhole.consume(treesets);
    }

    // ================== String Tests ==================

    @Benchmark
    public void BenchmarkTreeSet_Init_String_N16(Blackhole blackhole) {
        TreeSet<String> treesets = new TreeSet<String>(stringDataN16);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_String_N256(Blackhole blackhole) {
        TreeSet<String> treesets = new TreeSet<String>(stringDataN256);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_String_N2048(Blackhole blackhole) {
        TreeSet<String> treesets = new TreeSet<String>(stringDataN2048);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_String_N16384(Blackhole blackhole) {
        TreeSet<String> treesets = new TreeSet<String>(stringDataN16384);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_String_N131072(Blackhole blackhole) {
        TreeSet<String> treesets = new TreeSet<String>(stringDataN131072);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_String_N16_reserve(Blackhole blackhole) {
        TreeSet<String> treesets = new TreeSet<String>(stringDataN16_reserve);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_String_N256_reserve(Blackhole blackhole) {
        TreeSet<String> treesets = new TreeSet<String>(stringDataN256_reserve);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_String_N2048_reserve(Blackhole blackhole) {
        TreeSet<String> treesets = new TreeSet<String>(stringDataN2048_reserve);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_String_N16384_reserve(Blackhole blackhole) {
        TreeSet<String> treesets = new TreeSet<String>(stringDataN16384_reserve);
        blackhole.consume(treesets);
    }

    @Benchmark
    public void BenchmarkTreeSet_Init_String_N131072_reserve(Blackhole blackhole) {
        TreeSet<String> treesets = new TreeSet<String>(stringDataN131072_reserve);
        blackhole.consume(treesets);
    }
    
    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkTreeSet_Init.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
