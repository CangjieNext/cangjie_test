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
public class BenchmarkStringHashCode {
    static String str_8 = new String(new int [8], 0, 8).replace('\0', 'S');
    static String str_32 = new String(new int [32], 0, 32).replace('\0', 'S');
    static String str_256 = new String(new int [256], 0, 256).replace('\0', 'S');
    static String str_1k = new String(new int [1024], 0, 1024).replace('\0', 'S');
    static String str_1m = new String(new int [1024*1024], 0, 1024*1024).replace('\0', 'S');

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringHashCode_N8(Blackhole blackhole) {
        int code = str_8.hashCode();
        blackhole.consume(code);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringHashCode_N32(Blackhole blackhole) {
        int code = str_32.hashCode();
        blackhole.consume(code);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringHashCode_N256(Blackhole blackhole) {
        int code = str_256.hashCode();
        blackhole.consume(code);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringHashCode_N1k(Blackhole blackhole) {
        int code = str_1k.hashCode();
        blackhole.consume(code);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringHashCode_N1m(Blackhole blackhole) {
        int code = str_1m.hashCode();
        blackhole.consume(code);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringHashCode.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
