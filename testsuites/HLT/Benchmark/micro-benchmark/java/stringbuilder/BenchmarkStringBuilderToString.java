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
public class BenchmarkStringBuilderToString {
    static StringBuilder stringBuilder_32 = new StringBuilder(32);
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

    @Setup(Level.Trial)
    public void setup() {
        stringBuilder_32.append(array_32);
        stringBuilder_1k.append(array_1k);
        stringBuilder_1m.append(array_1m);
    }

    @Benchmark
    public String BenchmarkStringBuilderToString_N32() {
        String str = stringBuilder_32.toString();
        return str;
    }

    @Benchmark
    public String BenchmarkStringBuilderToString_N1k() {
        String str = stringBuilder_1k.toString();
        return str;
    }

    @Benchmark
    public String BenchmarkStringBuilderToString_N1m() {
        String str = stringBuilder_1m.toString();
        return str;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringBuilderToString.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
