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

public class BenchmarkWhile {
    static int sum = 0;

    @Benchmark
    public void BenchmarkWhileD1(Blackhole blackhole) {
        int n = 0;
        sum = 0;
        while (n < 100000) {
            n++;
            sum += n / 2;
        }
        blackhole.consume(sum);
        blackhole.consume(n);
    }

    @Benchmark
    public void BenchmarkWhileD2(Blackhole blackhole) {
        int n, m;
        n = m = 0;
        sum = 0;
        while (n < 1000) {
            n++;
            m = 0;
            while (m < 100) {
                m++;
                sum += (n + m) / 2;
            }
        }
        blackhole.consume(sum);
        blackhole.consume(n);
        blackhole.consume(m);
    }

    @Benchmark
    public void BenchmarkWhileD3(Blackhole blackhole) {
        int n, m, j;
        n = m = j = 0;
        sum = 0;
        while (n < 100) {
            n++;
            m = 0;
            while (m < 100) {
                m++;
                j = 0;
                while (j < 10) {
                    j++;
                    sum += (n + m + j) / 2;
                }
            }
        }
        blackhole.consume(sum);
        blackhole.consume(n);
        blackhole.consume(m);
        blackhole.consume(j);
    }

    @Benchmark
    public void BenchmarkWhileD4(Blackhole blackhole) {
        int n, m, j, k;
        n = m = j = k = 0;
        sum = 0;
        while (n < 100) {
            n++;
            m = 0;
            while (m < 10) {
                m++;
                j = 0;
                while (j < 10) {
                    j++;
                    k = 0;
                    while (k < 10) {
                        k++;
                        sum += (n + m + j + k) / 2;
                    }
                }
            }
        }
        blackhole.consume(sum);
        blackhole.consume(n);
        blackhole.consume(m);
        blackhole.consume(j);
        blackhole.consume(k);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkWhile.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
