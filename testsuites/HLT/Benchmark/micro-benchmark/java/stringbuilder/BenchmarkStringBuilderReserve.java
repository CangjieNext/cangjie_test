/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package stringbuilder;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.concurrent.TimeUnit;

// java 不存在reserve接口，仅模拟场景
@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkStringBuilderReserve {
    static StringBuilder stringBuilder = new StringBuilder(32);

    @Setup(Level.Invocation)
    public void setup() {
        stringBuilder = new StringBuilder(32);
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderReserve_N32() {
        stringBuilder = new StringBuilder(32);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderReserve_N1k() {
        stringBuilder = new StringBuilder(1024);
        return stringBuilder;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderReserve_N1m() {
        stringBuilder = new StringBuilder(1024 * 1024);
        return stringBuilder;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringBuilderReserve.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
