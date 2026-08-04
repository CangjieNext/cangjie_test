/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package collections_arraydeque;

import org.openjdk.jmh.annotations.*;
import org.openjdk.jmh.infra.Blackhole;
import org.openjdk.jmh.runner.Runner;
import org.openjdk.jmh.runner.RunnerException;
import org.openjdk.jmh.runner.options.Options;
import org.openjdk.jmh.runner.options.OptionsBuilder;

import java.util.ArrayDeque;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class BenchmarkArrayDeque_Init {
    @Benchmark
    public void BenchmarkArrayDeque_Init_Int64_N16(Blackhole blackhole) {
        ArrayDeque<Long> arrDeque = new ArrayDeque<Long>(16);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_Int64_N256(Blackhole blackhole) {
        ArrayDeque<Long> arrDeque = new ArrayDeque<Long>(256);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_Int64_N2048(Blackhole blackhole) {
        ArrayDeque<Long> arrDeque = new ArrayDeque<Long>(2048);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_Int64_N16384(Blackhole blackhole) {
        ArrayDeque<Long> arrDeque = new ArrayDeque<Long>(16384);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_Int64_N131072(Blackhole blackhole) {
        ArrayDeque<Long> arrDeque = new ArrayDeque<Long>(131072);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_Int64_N1048576(Blackhole blackhole) {
        ArrayDeque<Long> arrDeque = new ArrayDeque<Long>(1048576);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_String_N16(Blackhole blackhole) {
        ArrayDeque<String> arrDeque = new ArrayDeque<String>(16);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_String_N256(Blackhole blackhole) {
        ArrayDeque<String> arrDeque = new ArrayDeque<String>(256);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_String_N2048(Blackhole blackhole) {
        ArrayDeque<String> arrDeque = new ArrayDeque<String>(2048);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_String_N16384(Blackhole blackhole) {
        ArrayDeque<String> arrDeque = new ArrayDeque<String>(16384);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_String_N131072(Blackhole blackhole) {
        ArrayDeque<String> arrDeque = new ArrayDeque<String>(131072);
        blackhole.consume(arrDeque);
    }

    @Benchmark
    public void BenchmarkArrayDeque_Init_String_N1048576(Blackhole blackhole) {
        ArrayDeque<String> arrDeque = new ArrayDeque<String>(1048576);
        blackhole.consume(arrDeque);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkArrayDeque_Init.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
