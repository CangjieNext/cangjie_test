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

import java.lang.reflect.Method;
import java.util.concurrent.TimeUnit;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class Benchmark_ClassTypeInfo_invokeFunction {
    Method MethodFoo1_class02;
    Method MethodFoo1_class03;
    Method MethodFoo1_class05_Int64;

    Method MethodFoo2_class02;
    Method MethodFoo2_class03;
    Method MethodFoo2_class05_Generic;

    @Setup(Level.Invocation)
    public void setup() throws ClassNotFoundException, NoSuchMethodException {
        MethodFoo1_class02 = Class.forName("reflect" + "." + "class_02").getMethod("foo1");
        MethodFoo1_class03 = Class.forName("reflect" + "." + "class_03").getMethod("foo1");
        MethodFoo1_class05_Int64 = Class.forName("reflect" + "." + "class_05").getMethod("foo1");

        MethodFoo2_class02 = Class.forName("reflect" + "." + "class_02").getMethod("foo2");
        MethodFoo2_class03 = Class.forName("reflect" + "." + "class_03").getMethod("foo2");
        MethodFoo2_class05_Generic = Class.forName("reflect" + "." + "class_05").getMethod("foo2", Object.class);
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_invokeFunction_commontype_Instance_apply(Blackhole blackhole) throws Throwable {
        class_02 instance = new class_02();
        blackhole.consume(MethodFoo1_class02.invoke(instance));
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_invokeFunction_inherittype_Instance_apply(Blackhole blackhole) throws Throwable {
        class_03 instance = new class_03();
        blackhole.consume(MethodFoo1_class03.invoke(instance));
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_invokeFunction_generic_commontype_Instance_apply(Blackhole blackhole) throws Throwable {
        class_05 instance = new class_05<Long>(10L);
        blackhole.consume(MethodFoo1_class05_Int64.invoke(instance));
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_invokeFunction_commontype_Static_apply(Blackhole blackhole) throws Throwable {
        class_02 instance = new class_02();
        blackhole.consume(MethodFoo2_class02.invoke(instance));
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_invokeFunction_inherittype_Static_apply(Blackhole blackhole) throws Throwable {
        class_03 instance = new class_03();
        blackhole.consume(MethodFoo2_class03.invoke(instance));
    }

    @Benchmark
    public void Benchmark_ClassTypeInfo_invokeFunction_generic_commontype_Static_apply(Blackhole blackhole) throws Throwable {
        class_05 instance = new class_05<Long>(10L);
        blackhole.consume(MethodFoo2_class05_Generic.invoke(instance, 10L));
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(Benchmark_ClassTypeInfo_invokeFunction.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
