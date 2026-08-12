/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package stringbuilder;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.Arrays;
import java.util.concurrent.TimeUnit;

// java 不支持rune类型， 也未提供从char数组的直接构造方法
// 因此采用从CharSequence 或 char 来构造

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkStringBuilderInit {
    static char[] array_32 = new char[32];
    static char[] array_1k = new char[1024];
    static char[] array_1m = new char[1024 * 1024];

    static {
        Arrays.fill(array_32, 'A');
        Arrays.fill(array_1k, 'A');
        Arrays.fill(array_1m, 'A');
    }
    static String string_32 = new String(array_32);
    static String string_1k = new String(array_1k);
    static String string_1m = new String(array_1m);
    static CharSequence charSequence_32 = new String(array_32);
    static CharSequence charSequence_1k = new String(array_1k);
    static CharSequence charSequence_1m = new String(array_1m);

    public StringBuilder stringBuilder_from_char(char seq, int size) {
        StringBuilder stringBuilder = new StringBuilder(size);
        for (int i = 0; i < size; i++) {
            stringBuilder.append(seq);
        }
        return stringBuilder;
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_Empty_N32(Blackhole blackhole) {
        StringBuilder stringbuilder_empty = new StringBuilder(32);
        blackhole.consume(stringbuilder_empty);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_Empty_N1k(Blackhole blackhole) {
        StringBuilder stringbuilder_empty = new StringBuilder(1024);
        blackhole.consume(stringbuilder_empty);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_Empty_N1m(Blackhole blackhole) {
        StringBuilder stringbuilder_empty = new StringBuilder(1024 * 1024);
        blackhole.consume(stringbuilder_empty);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_From_str_N32(Blackhole blackhole) {
        StringBuilder stringbuilder = new StringBuilder(string_32);
        blackhole.consume(stringbuilder);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_From_str_N1k(Blackhole blackhole) {
        StringBuilder stringbuilder = new StringBuilder(string_1k);
        blackhole.consume(stringbuilder);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_From_str_N1m(Blackhole blackhole) {
        StringBuilder stringbuilder = new StringBuilder(string_1m);
        blackhole.consume(stringbuilder);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_Fromrune_N32(Blackhole blackhole) {
        StringBuilder stringbuilder = stringBuilder_from_char('A', 32);
        blackhole.consume(stringbuilder);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_Fromrune_N1k(Blackhole blackhole) {
        StringBuilder stringbuilder = stringBuilder_from_char('A', 1024);
        blackhole.consume(stringbuilder);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_Fromrune_N1m(Blackhole blackhole) {
        StringBuilder stringbuilder = stringBuilder_from_char('A', 1024 * 1024);
        blackhole.consume(stringbuilder);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_Fromarray_N32(Blackhole blackhole) {
        StringBuilder stringbuilder = new StringBuilder(charSequence_32);
        blackhole.consume(stringbuilder);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_Fromarray_N1k(Blackhole blackhole) {
        StringBuilder stringbuilder = new StringBuilder(charSequence_1k);
        blackhole.consume(stringbuilder);
    }

    @Benchmark
    public void BenchmarkStringBuilderInit_Fromarray_N1m(Blackhole blackhole) {
        StringBuilder stringbuilder = new StringBuilder(charSequence_1m);
        blackhole.consume(stringbuilder);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringBuilderInit.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
