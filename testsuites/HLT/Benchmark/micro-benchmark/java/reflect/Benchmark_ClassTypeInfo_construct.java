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

import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class Benchmark_ClassTypeInfo_construct {
    Class<?> clazz_01;
    Class<?> clazz_02;
    Class<?> clazz_03;
    Class<?> clazz_04;
    Class<?> clazz_05;

    @Setup(Level.Invocation)
    public void setup() throws ClassNotFoundException {
        clazz_01 = Class.forName("reflect" + "." + "class_01");
        clazz_02 = Class.forName("reflect" + "." + "class_02");
        clazz_03 = Class.forName("reflect" + "." + "class_03");
        clazz_04 = Class.forName("reflect" + "." + "class_04");
        clazz_05 = Class.forName("reflect" + "." + "class_05");
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_construct_basetype(Blackhole blackhole) throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        blackhole.consume(clazz_01.getDeclaredConstructor().newInstance());
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_construct_commontype(Blackhole blackhole) throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        blackhole.consume(clazz_02.getDeclaredConstructor().newInstance());
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_construct_inherittype(Blackhole blackhole) throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        blackhole.consume(clazz_03.getDeclaredConstructor().newInstance());
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_construct_generic_basetype(Blackhole blackhole) throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        blackhole.consume(clazz_04.getDeclaredConstructor().newInstance());
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_construct_generic_commontype(Blackhole blackhole) throws NoSuchMethodException, InvocationTargetException, InstantiationException, IllegalAccessException {
        blackhole.consume(clazz_05.getDeclaredConstructor(Object.class).newInstance(10L));
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(Benchmark_ClassTypeInfo_construct.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
