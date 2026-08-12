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
public class BenchmarkStringLess {
    static String str_1   = new String(new int [1], 0, 1).replace('\0', 'H');
    static String str_1_notGreater   = new String(new int [1], 0, 1).replace('\0', 'S');
    static String str_1k   = new String(new int [1024], 0, 1024).replace('\0', 'H');
    static String str_1k_notGreater   = new String(new int [1023], 0, 1023).replace('\0', 'H') + "S";
    static String str_1m   = new String(new int [1024*1024], 0, 1024*1024).replace('\0', 'H');
    static String str_1m_notGreater   = new String(new int [1024*1024-1], 0, 1024*1024-1).replace('\0', 'H') + "S";

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringLess_N1_Less(Blackhole blackhole) {
        int flag = str_1_notGreater.compareTo(str_1);
        blackhole.consume(flag);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringLess_N1_notLess(Blackhole blackhole) {
        int flag = str_1.compareTo(str_1_notGreater);
        blackhole.consume(flag);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringLess_N1k_Less(Blackhole blackhole) {
        int flag = str_1k_notGreater.compareTo(str_1k);
        blackhole.consume(flag);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringLess_N1k_notLess(Blackhole blackhole) {
        int flag = str_1k.compareTo(str_1k_notGreater);
        blackhole.consume(flag);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringLess_N1m_Less(Blackhole blackhole) {
        int flag = str_1m_notGreater.compareTo(str_1m);
        blackhole.consume(flag);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringLess_N1m_notLess(Blackhole blackhole) {
        int flag = str_1m.compareTo(str_1m_notGreater);
        blackhole.consume(flag);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringLess.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
