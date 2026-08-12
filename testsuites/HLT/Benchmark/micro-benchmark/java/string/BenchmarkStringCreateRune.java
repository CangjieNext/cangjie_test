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

// java 不存在rune类型， 故这里使用int构造，结果仅供参考

@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkStringCreateRune {
    static int [] charArray_N8 = new int [8];
    static int [] charArray_N32 = new int [32];
    static int [] charArray_N256 = new int [256];
    static int [] charArray_N1K = new int [1024];
    static int [] charArray_N1M = new int [1024 * 1024];

    @Setup
    public void setup(){
        for (int i = 0; i < 8; i++) {
            charArray_N8[i] = 72;
        }
        for (int i = 0; i < 32; i++) {
            charArray_N32[i] = 72;
        }
        for (int i = 0; i < 256; i++) {
            charArray_N256[i] = 72;
        }
        for (int i = 0; i < 1024; i++) {
            charArray_N1K[i] = 72;
        }
        for (int i = 0; i < 1024*1024; i++) {
            charArray_N1M[i] = 72;
        }
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCreateRune_N8(Blackhole blackhole) {
        String str = new String(charArray_N8, 0,8);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCreateRune_N32(Blackhole blackhole) {
        String str = new String(charArray_N32, 0,32);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCreateRune_N256(Blackhole blackhole) {
        String str = new String(charArray_N256, 0,256);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCreateRune_N1K(Blackhole blackhole) {
        String str = new String(charArray_N1K, 0, 1024);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringCreateRune_N1M(Blackhole blackhole) {
        String str = new String(charArray_N1M, 0, 1024*1024);
        blackhole.consume(str);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringCreateRune.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
