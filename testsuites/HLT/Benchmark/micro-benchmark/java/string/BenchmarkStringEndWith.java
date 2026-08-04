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
public class BenchmarkStringEndWith {
    static String str_1   = new String(new int [1], 0, 1).replace('\0', 'H');
    static String str_1k   = new String(new int [1024], 0, 1024).replace('\0', 'H');
    static String str_1m   = new String(new int [1024*1024], 0, 1024*1024).replace('\0', 'H');

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringEndWith_N1(Blackhole blackhole) {
        boolean flag = str_1.endsWith("H");
        blackhole.consume(flag);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringEndWith_N1k(Blackhole blackhole) {
        boolean flag = str_1k.endsWith("H");
        blackhole.consume(flag);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringEndWith_N1m(Blackhole blackhole) {
        boolean flag = str_1m.endsWith("H");
        blackhole.consume(flag);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringEndWith.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }

}
