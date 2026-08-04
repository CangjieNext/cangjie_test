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

// java 不存在reset接口，仅模拟场景
@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkStringBuilderReset {
    static StringBuilder stringBuilder_32 = new StringBuilder(32);
    static StringBuilder stringBuilder_1k = new StringBuilder(1024);
    static StringBuilder stringBuilder_1m = new StringBuilder(1024 * 1024);

    @Setup(Level.Invocation)
    public void setup() {
        stringBuilder_32 = new StringBuilder(32);
        stringBuilder_1k = new StringBuilder(1024);
        stringBuilder_1m = new StringBuilder(1024 * 1024);
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderReset_N32() {
        stringBuilder_32 = new StringBuilder();
        return stringBuilder_32;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderReset_N1k() {
        stringBuilder_1k = new StringBuilder();
        return stringBuilder_1k;
    }

    @Benchmark
    public StringBuilder BenchmarkStringBuilderReset_N1m() {
        stringBuilder_1m = new StringBuilder();
        return stringBuilder_1m;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkStringBuilderReset.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
