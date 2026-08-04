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

@Fork(1)
public class BenchmarkStringCount {
    static String str_8 = new String(new int [8], 0, 8).replace('\0', 'H');
    static String str_32 = new String(new int [32], 0, 32).replace('\0', 'H');
    static String str_256 = new String(new int [256], 0, 256).replace('\0', 'H');
    static String str_1k   = new String(new int [1024], 0, 1024).replace('\0', 'H');
    static String str_1m   = new String(new int [1024*1024], 0, 1024*1024).replace('\0', 'H');

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCount_N8(Blackhole blackhole) {
        int count = 0;
        for (int i = 0; i < str_8.length(); i++) {
            if (str_8.charAt(i) == 'H') {
                count++;
            }
        }
        blackhole.consume(count);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCount_N32(Blackhole blackhole) {
        int count = 0;
        for (int i = 0; i < str_32.length(); i++) {
            if (str_32.charAt(i) == 'H') {
                count++;
            }
        }
        blackhole.consume(count);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCount_N256(Blackhole blackhole) {
        int count = 0;
        for (int i = 0; i < str_256.length(); i++) {
            if (str_256.charAt(i) == 'H') {
                count++;
            }
        }
        blackhole.consume(count);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCount_N1k(Blackhole blackhole) {
        int count = 0;
        for (int i = 0; i < str_1k.length(); i++) {
            if (str_1k.charAt(i) == 'H') {
                count++;
            }
        }
        blackhole.consume(count);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCount_N1m(Blackhole blackhole) {
        int count = 0;
        for (int i = 0; i < str_1m.length(); i++) {
            if (str_1m.charAt(i) == 'H') {
                count++;
            }
        }
        blackhole.consume(count);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringCount.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
