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

@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkStringCreateUInt8 {
    static byte [] utf8Bytes_8 = new byte[8];
    static byte [] utf8Bytes_32 = new byte[32];
    static byte [] utf8Bytes_256 = new byte[256];
    static byte [] utf8Bytes_1K = new byte[1024];
    static byte [] utf8Bytes_1M = new byte[1024 * 1024];

    @Setup
    public void setup(){
        for (int i = 0; i < 8; i++) {
            utf8Bytes_8[i] = 79;
        }
        for (int i = 0; i < 32; i++) {
            utf8Bytes_32[i] = 79;
        }
        for (int i = 0; i < 256; i++) {
            utf8Bytes_256[i] = 79;
        }
        for (int i = 0; i < 1024; i++) {
            utf8Bytes_1K[i] = 79;
        }
        for (int i = 0; i < 1024 * 1024; i++) {
            utf8Bytes_1M[i] = 79;
        }
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCreateUInt8_N8(Blackhole blackhole) {
        String str = new String(utf8Bytes_8);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCreateUInt8_N32(Blackhole blackhole) {
        String str = new String(utf8Bytes_32);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCreateUInt8_N256(Blackhole blackhole) {
        String str = new String(utf8Bytes_256);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCreateUInt8_N1K(Blackhole blackhole) {
        String str = new String(utf8Bytes_1K);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCreateUInt8_N1M(Blackhole blackhole) {
        String str = new String(utf8Bytes_1M);
        blackhole.consume(str);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringCreateUInt8.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
