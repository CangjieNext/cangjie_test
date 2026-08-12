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

import java.util.Arrays;
import java.util.concurrent.TimeUnit;

@Fork(1)
@State(Scope.Benchmark)
public class BenchmarkStringJoin {
    static String [] str_8 = new String [8];
    static String [] str_32 = new String [32];
    static String [] str_256 = new String [256];
    static String [] str_1k = new String [1024];
    static String [] str_1m = new String [1024 * 1024];

    @Setup
    public void setup(){
        Arrays.fill(str_8, "s");
        Arrays.fill(str_32, "s");
        Arrays.fill(str_256, "s");
        Arrays.fill(str_1k, "s");
        Arrays.fill(str_1m, "s");
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringJoin_N8(Blackhole blackhole) {
        String str = String.join("", str_8);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringJoin_N32(Blackhole blackhole) {
        String str = String.join("", str_32);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringJoin_N256(Blackhole blackhole) {
        String str = String.join("", str_256);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringJoin_N1k(Blackhole blackhole) {
        String str = String.join("", str_1k);
        blackhole.consume(str);
    }

    @Benchmark
    @BenchmarkMode(Mode.AverageTime)
    @Warmup(iterations = 1, time = 1)
    @OutputTimeUnit(TimeUnit.NANOSECONDS)
    @Measurement(iterations = 1)
    public void BenchmarkStringJoin_N1m(Blackhole blackhole) {
        String str = String.join("", str_1m);
        blackhole.consume(str);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringJoin.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
