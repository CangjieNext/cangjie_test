/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package string;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.concurrent.TimeUnit;

// java 中不存在rune类型， 也不存在转此类型array的方法， 本用例仅供参考
@Fork(1)
public class BenchmarkStringRuneArray {
    static String str_8   = new String(new int [8], 0, 8).replace('\0', 'H');
    static String str_32   = new String(new int [32], 0, 32).replace('\0', 'H');
    static String str_256   = new String(new int [256], 0, 256).replace('\0', 'H');
    static String str_1k   = new String(new int [1024], 0, 1024).replace('\0', 'H');
    static String str_1m   = new String(new int [1024*1024], 0, 1024*1024).replace('\0', 'H');

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringRuneArray_N8(Blackhole blackhole) {
        int[] runes = str_8.codePoints().toArray();
        blackhole.consume(runes);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringRuneArray_N32(Blackhole blackhole) {
        int[] runes = str_32.codePoints().toArray();
        blackhole.consume(runes);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringRuneArray_N256(Blackhole blackhole) {
        int[] runes = str_256.codePoints().toArray();
        blackhole.consume(runes);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringRuneArray_N1k(Blackhole blackhole) {
        int[] runes = str_1k.codePoints().toArray();
        blackhole.consume(runes);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringRuneArray_N1m(Blackhole blackhole) {
        int[] runes = str_1m.codePoints().toArray();
        blackhole.consume(runes);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringRuneArray.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
