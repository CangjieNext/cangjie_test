/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package stringbuilder;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.Arrays;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkStringBuilderAppend {
    static StringBuilder stringBuilder = new StringBuilder(32);
    static StringBuilder stringBuilder_1k = new StringBuilder(1024);
    static StringBuilder stringBuilder_1m = new StringBuilder(1024 * 1024);

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
    static StringBuffer stringBuffer_32 = new StringBuffer(string_32);
    static StringBuffer stringBuffer_1k = new StringBuffer(string_1k);
    static StringBuffer stringBuffer_1m = new StringBuffer(string_1m);
    static CharSequence charSequence_32 = new String(array_32);
    static CharSequence charSequence_1k = new String(array_1k);
    static CharSequence charSequence_1m = new String(array_1m);

    @Setup(Level.Invocation)
    public void setup() {
        stringBuilder = new StringBuilder(32);
        stringBuilder_1k = new StringBuilder(1024);
        stringBuilder_1m = new StringBuilder(1024 * 1024);
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_Bool() {
        stringBuilder.append(true);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_Int64() {
        stringBuilder.append(-9223372036854775808l);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_Int32() {
        stringBuilder.append(-2147483648);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_Int16() {
        stringBuilder.append((short)-32768);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_Int8() {
        stringBuilder.append((byte)-128);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_Float64() {
        stringBuilder.append(2e3d);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_Float32() {
        stringBuilder.append(2e3f);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_Rune() {
        stringBuilder.append('A');
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_String_N32() {
        stringBuilder.append(string_32);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_String_N1k() {
        stringBuilder_1k.append(string_1k);
        return stringBuilder_1k;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_String_N1m() {
        stringBuilder_1m.append(string_1m);
        return stringBuilder_1m;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_RuneArray_N32() {
        stringBuilder.append(array_32);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_RuneArray_N1k() {
        stringBuilder_1k.append(array_1k);
        return stringBuilder_1k;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_RuneArray_N1m() {
        stringBuilder_1m.append(array_1m);
        return stringBuilder_1m;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_StringBuilder_N32() {
        stringBuilder.append(stringBuffer_32);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_StringBuilder_N1k() {
        stringBuilder_1k.append(stringBuffer_1k);
        return stringBuilder_1k;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppend_StringBuilder_N1m() {
        stringBuilder_1m.append(stringBuffer_1m);
        return stringBuilder_1m;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppendFromUtf8_N32() {
        stringBuilder.append(charSequence_32);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppendFromUtf8_N1k() {
        stringBuilder_1k.append(charSequence_1k);
        return stringBuilder_1k;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderAppendFromUtf8_N1m() {
        stringBuilder_1m.append(charSequence_1m);
        return stringBuilder_1m;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringBuilderAppend.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
