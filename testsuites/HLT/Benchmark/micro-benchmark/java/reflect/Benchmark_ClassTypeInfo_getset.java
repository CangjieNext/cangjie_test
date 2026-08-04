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

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class Benchmark_ClassTypeInfo_getset {
    Field field_v1_02;
    Field field_v2_02 ;
    Object object_02;
    Field field_v1_05;
    Field field_v2_05;
    Object object_05;

    @Setup(Level.Invocation)
    public void setup() throws ClassNotFoundException, NoSuchFieldException, InstantiationException, IllegalAccessException, NoSuchMethodException, InvocationTargetException {
        Class<?> clazz_02 = Class.forName("reflect" + "." + "class_02");
        field_v1_02 = clazz_02.getDeclaredField("v1");
        field_v2_02 = clazz_02.getDeclaredField("v2");
        object_02 = clazz_02.newInstance();

        Class<?> clazz_05 = Class.forName("reflect" + "." + "class_05");
        field_v1_05 = clazz_05.getDeclaredField("v1");
        field_v2_05 = clazz_05.getDeclaredField("v2");
        object_05 = clazz_05.getDeclaredConstructor(Object.class).newInstance(10L);
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_getset_commontype_Instance_getValue(Blackhole blackhole) throws IllegalAccessException {
        blackhole.consume(field_v1_02.get(object_02));
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_getset_generic_commontype_Instance_getValue(Blackhole blackhole) throws IllegalAccessException {
        blackhole.consume(field_v1_05.get(object_05));
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_getset_commontype_Instance_setValue(Blackhole blackhole) throws IllegalAccessException {
        field_v1_02.set(object_02, 10L);
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_getset_generic_commontype_Instance_setValue(Blackhole blackhole) throws IllegalAccessException {
        field_v1_05.set(object_05, 10L);
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_getset_commontype_Static_getValue(Blackhole blackhole) throws IllegalAccessException {
        blackhole.consume(field_v2_02.get(object_02));
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_getset_generic_commontype_Static_getValue(Blackhole blackhole) throws IllegalAccessException {
        blackhole.consume(field_v2_05.get(object_05));
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_getset_commontype_Static_setValue(Blackhole blackhole) throws IllegalAccessException {
        field_v2_02.set(object_02, "test");
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_getset_generic_commontype_Static_setValue(Blackhole blackhole) throws IllegalAccessException {
        field_v2_05.set(object_05, 10L);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(Benchmark_ClassTypeInfo_getset.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
