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
public class BenchmarkStringIndexOfString {
    static String str_1 = "s";

    static String str_1k   = new String(new int [1024], 0, 1024).replace('\0', 'H');

    static String str_1k_mid   = str_1k.substring(0, 512) + "r" + str_1k.substring(513);

    static String str_1k_end   = str_1k.substring(0, 1023) + "r";

    static String str_1m   = new String(new int [1024 * 1024], 0, 1024 * 1024).replace('\0', 'H');

    static String str_1m_mid   = str_1m.substring(0, 1024*512) + "r" + str_1m.substring(1024*512+1);

    static String str_1m_end   = str_1m.substring(0, 1024 * 1024 - 1) + "r";

    static String str_long_1K = str_1k.substring(0, 512) + "abcdefgabcdefgabcdef" + str_1k.substring(532);

    static String str_long_1M = str_1m.substring(0, 1024 * 512) + "abcdefgabcdefgabcdef" + str_1m.substring(1024*512+20);

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringIndexOfString_N1(Blackhole blackhole) {
        int index = str_1.indexOf(115);
        blackhole.consume(index);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringIndexOfString_N1k_start(Blackhole blackhole) {
        int index = str_1k.indexOf("s");
        blackhole.consume(index);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringIndexOfString_N1k_mid(Blackhole blackhole) {
        int index = str_1k_mid.indexOf("r");
        blackhole.consume(index);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringIndexOfString_N1k_end(Blackhole blackhole) {
        int index = str_1k_end.indexOf("r");
        blackhole.consume(index);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringIndexOfString_N1m_start(Blackhole blackhole) {
        int index = str_1m.indexOf("s");
        blackhole.consume(index);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringIndexOfString_N1m_mid(Blackhole blackhole) {
        int index = str_1m_mid.indexOf("r");
        blackhole.consume(index);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringIndexOfString_N1m_end(Blackhole blackhole) {
        int index = str_1m_end.indexOf("r");
        blackhole.consume(index);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringIndexOfStringLongMatch_N1k(Blackhole blackhole) {
        int index = str_long_1K.indexOf("abcdefgabcdefgabcdef");
        blackhole.consume(index);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringIndexOfStringLongMatch_N1m(Blackhole blackhole) {
        int index = str_long_1M.indexOf("BenchmarkStringIndexOfStringLongMatch_N1k");
        blackhole.consume(index);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringIndexOfString.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
