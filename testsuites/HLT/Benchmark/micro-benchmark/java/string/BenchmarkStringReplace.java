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
public class BenchmarkStringReplace {
    static String str_8 = new String(new int [8], 0, 8).replace('\0', 'H');
    static String str_32 = new String(new int [32], 0, 32).replace('\0', 'H');
    static String str_256 = new String(new int [256], 0, 256).replace('\0', 'H');
    static String str_1k_all   = new String(new int [1024], 0, 1024).replace('\0', 'H');

    static String str_1k_half  = str_1k_all.substring(0, 512) + str_1k_all.substring(512).replace('H', 'R');

    static String str_1k  = new String(new int [1023], 0, 1023).replace('\0', 'R') + "H";

    static String str_1m_all   = new String(new int [1024*1024], 0, 1024*1024).replace('\0', 'H');

    static String str_1m_half  = str_1m_all.substring(0, 512*1024) + str_1m_all.substring(512*1024).replace('H', 'R');

    static String str_1m  = new String(new int [1024*1024-1], 0, 1024*1024-1).replace('\0', 'R') + "H";

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringReplace_N8(Blackhole blackhole) {
        String str = str_8.replace("H", "R");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringReplace_N32(Blackhole blackhole) {
        String str = str_32.replace("H", "R");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringReplace_N256(Blackhole blackhole) {
        String str = str_256.replace("H", "R");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringReplace_N1k(Blackhole blackhole) {
        String str = str_1k.replace("H", "R");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringReplace_N1k_half(Blackhole blackhole) {
        String str = str_1k_half.replace("H", "R");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringReplace_N1k_all(Blackhole blackhole) {
        String str = str_1k_all.replace("H", "R");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringReplace_N1m(Blackhole blackhole) {
        String str = str_1m.replace("H", "R");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringReplace_N1m_half(Blackhole blackhole) {
        String str = str_1m_half.replace("H", "R");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringReplace_N1m_all(Blackhole blackhole) {
        String str = str_1m_all.replace("H", "R");
        blackhole.consume(str);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringReplace.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
