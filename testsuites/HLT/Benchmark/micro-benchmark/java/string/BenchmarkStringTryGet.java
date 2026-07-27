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

// java 中不存在对应接口， 使用charAt, 内存大小最接近byte
@Fork(1)
public class BenchmarkStringTryGet {
    static String str_1 = "H";

    static String str_1k   = new String(new int [1024], 0, 1024).replace('\0', 'H');

    static String str_1m   = new String(new int [1024 * 1024], 0, 1024 * 1024).replace('\0', 'H');

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringTryGet_N1(Blackhole blackhole) {
        char getchar = str_1.charAt(0);
        blackhole.consume(getchar);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringTryGet_N1k_start(Blackhole blackhole) {
        char getchar = str_1k.charAt(0);
        blackhole.consume(getchar);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringTryGet_N1k_middle(Blackhole blackhole) {
        char getchar = str_1k.charAt(512);
        blackhole.consume(getchar);
    }
    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringTryGet_N1k_end(Blackhole blackhole) {
        char getchar = str_1k.charAt(1023);
        blackhole.consume(getchar);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringTryGet_N1m_start(Blackhole blackhole) {
        char getchar = str_1m.charAt(0);
        blackhole.consume(getchar);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringTryGet_N1m_middle(Blackhole blackhole) {
        char getchar = str_1m.charAt(512 * 1024);
        blackhole.consume(getchar);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringTryGet_N1m_end(Blackhole blackhole) {
        char getchar = str_1m.charAt(1024 * 1024 - 1);
        blackhole.consume(getchar);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringTryGet.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
