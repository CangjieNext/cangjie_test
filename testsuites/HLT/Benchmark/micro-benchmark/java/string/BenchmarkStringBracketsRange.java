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
public class BenchmarkStringBracketsRange {
    static String str_1 = "H";

    static String str_1k   = new String(new int [1024], 0, 1024).replace('\0', 'H');

    static String str_1m   = new String(new int [1024 * 1024], 0, 1024 * 1024).replace('\0', 'H');

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringBracketsRange_N1(Blackhole blackhole) {
        String str = str_1.substring(0,1);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringBracketsRange_N1k_one(Blackhole blackhole) {
        String str = str_1k.substring(0,1);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringBracketsRange_N1k_middle(Blackhole blackhole) {
        String str = str_1k.substring(0,512);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringBracketsRange_N1k_end(Blackhole blackhole) {
        String str = str_1k.substring(0,1024);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringBracketsRange_N1m_one(Blackhole blackhole) {
        String str = str_1m.substring(0,1);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringBracketsRange_N1m_middle(Blackhole blackhole) {
        String str = str_1m.substring(0,512*1024);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringBracketsRange_N1m_end(Blackhole blackhole) {
        String str = str_1m.substring(0,1024*1024);
        blackhole.consume(str);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringBracketsRange.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
