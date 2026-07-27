/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package reflect;

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
public class Benchmark_ClassTypeInfo_of {
    @Benchmark
    public void Benchmark_ClassTypeInfo_of_basetype(Blackhole blackhole) {
        blackhole.consume(new class_01().getClass());
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_of_commontype(Blackhole blackhole) {
        blackhole.consume(new class_02().getClass());
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_of_inherittype(Blackhole blackhole) {
        blackhole.consume(new class_03().getClass());
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_of_generic_basetype(Blackhole blackhole) {
        blackhole.consume(new class_04<Long>().getClass());
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_of_generic_commontype(Blackhole blackhole) {
        blackhole.consume(new class_05<Long>(10L).getClass());
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(Benchmark_ClassTypeInfo_of.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
