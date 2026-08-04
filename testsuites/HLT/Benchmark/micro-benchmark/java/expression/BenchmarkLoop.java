/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package expression;

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
public class BenchmarkLoop {
    static int sum = 0;

    @Benchmark
    public void BenchmarkLoopD1(Blackhole blackhole) {
        sum = 0;
        for (int j = 0; j < 100000; j++) {
            sum += j / 2;
        }
        blackhole.consume(sum);
    }

    @Benchmark
    public void BenchmarkLoopD2(Blackhole blackhole) {
        sum = 0;
        for (int j = 0; j < 1000; j++) {
            for (int k = 0; k < 100; k++) {
                sum += (j + k) / 2;
            }
        }
        blackhole.consume(sum);
    }

    @Benchmark
    public void BenchmarkLoopD3(Blackhole blackhole) {
        sum = 0;
        for (int j = 0; j < 100; j++) {
            for (int k = 0; k < 100; k++) {
                for (int l = 0; l < 10; l++) {
                    sum += (j + k + l) / 2;
                }
            }
        }
        blackhole.consume(sum);
    }

    @Benchmark
    public void BenchmarkLoopD4(Blackhole blackhole) {
        sum = 0;
        for (int j = 0; j < 100; j++) {
            for (int k = 0; k < 10; k++) {
                for (int l = 0; l < 10; l++) {
                    for (int m = 0; m < 10; m++) {
                        sum += (j + k + l + m) / 2;
                    }
                }
            }
        }
        blackhole.consume(sum);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkLoop.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
