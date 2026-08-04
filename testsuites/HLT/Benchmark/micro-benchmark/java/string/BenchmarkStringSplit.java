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
public class BenchmarkStringSplit {
    static String str_8 = "HHHHHHHH";
    static String str_32 = new String(new int [32], 0, 32).replace('\0', 'H');
    static String str_256 = new String(new int [256], 0, 256).replace('\0', 'H');

    static String str_1k   = new String(new int [511], 0, 511).replace('\0', 'H') + "," + new String(new int [512], 0, 512).replace('\0', 'H');

    static String str_1m   = new String(new int [1024 * 512], 0, 1024*512).replace('\0', 'H') + "," +new String(new int [1024 * 512-1], 0, 1024*512-1).replace('\0', 'H');

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringSplit_N8(Blackhole blackhole) {
        String [] str = str_8.split("");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringSplit_N32(Blackhole blackhole) {
        String [] str = str_32.split("");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringSplit_N256(Blackhole blackhole) {
        String [] str = str_256.split("");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringSplit_N1k_one(Blackhole blackhole) {
        String [] str = str_1k.split(",");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringSplit_N1k_all(Blackhole blackhole) {
        String [] str = str_1k.split("");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringSplit_N1m_one(Blackhole blackhole) {
        String [] str = str_1m.split(",");
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringSplit_N1m_all(Blackhole blackhole) {
        String [] str = str_1m.split("");
        blackhole.consume(str);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringSplit.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
