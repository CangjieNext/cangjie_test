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

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkStringMul {
    static String str_1 = "H";

    static String str_1k   = new String(new int [1024], 0, 1024).replace('\0', 'H');

    static String str_1m   = new String(new int [1024 * 1024], 0, 1024 * 1024).replace('\0', 'H');

    @Benchmark
    public void BenchmarkStringMul_N1_10(Blackhole blackhole) {
        String str = "";
        for (int i = 0; i < 10; i++) {
            str += str_1;
        }
        blackhole.consume(str);
    }

    @Benchmark
    public void BenchmarkStringMul_N1_100(Blackhole blackhole) {
        String str = "";
        for (int i = 0; i < 100; i++) {
            str += str_1;
        }
        blackhole.consume(str);
    }

    @Benchmark
    public void BenchmarkStringMul_N1_1000(Blackhole blackhole) {
        String str = "";
        for (int i = 0; i < 1000; i++) {
            str += str_1;
        }
        blackhole.consume(str);
    }

    @Benchmark
    public void BenchmarkStringMul_N1k_10(Blackhole blackhole) {
        String str = "";
        for (int i = 0; i < 10; i++) {
            str += str_1k;
        }
        blackhole.consume(str);
    }

    @Benchmark
    public void BenchmarkStringMul_N1k_100(Blackhole blackhole) {
        String str = "";
        for (int i = 0; i < 100; i++) {
            str += str_1k;
        }
        blackhole.consume(str);
    }

    @Benchmark
    public void BenchmarkStringMul_N1k_1000(Blackhole blackhole) {
        String str = "";
        for (int i = 0; i < 1000; i++) {
            str += str_1k;
        }
        blackhole.consume(str);
    }

    @Benchmark
    public void BenchmarkStringMul_N1m_10(Blackhole blackhole) {
        String str = "";
        for (int i = 0; i < 10; i++) {
            str += str_1m;
        }
        blackhole.consume(str);
    }

    @Benchmark
    public void BenchmarkStringMul_N1m_100(Blackhole blackhole) {
        String str = "";
        for (int i = 0; i < 100; i++) {
            str += str_1m;
        }
        blackhole.consume(str);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringMul.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
