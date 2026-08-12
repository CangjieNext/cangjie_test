/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package lambda;

import org.openjdk.jmh.annotations.*;
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
public class TestLambdaComposition {
    interface F {
        double apply(int x);
    }

    interface G_H {
        long apply(double x);
    }

    interface K1 {
        long apply(long x);
    }

    interface K2 {
        double apply(long x);
    }

    interface Composition {
        long apply(int x);
    }

    static Composition compositionBlackHole = null;

    static F f     = (int x)    -> (double) x * .5;
    static G_H g_h = (double x) -> (long) x;
    static K1 k1   = (long x)   -> x + 2;
    static K2 k2   = (long x)   -> (double) x * 2.25;

    @Param({"512"})
    public int i;

    @Benchmark
    public long BenchmarkLambdaComposition(TestLambdaComposition d) {
        Composition lambda = (int x) -> {
            return d.g_h.apply(d.f.apply(x));  // <=> f ~> g
        };
        compositionBlackHole = lambda;
        return lambda.apply(d.i);
    }

    @Benchmark
    public long BenchmarkLambdaComposition2(TestLambdaComposition d) {
        Composition lambda = (int x) -> {
            return d.k1.apply(d.g_h.apply(d.f.apply(x)));  // <=> f ~> g ~> k
        };
        compositionBlackHole = lambda;
        return lambda.apply(d.i);
    }

    @Benchmark
    public long BenchmarkLambdaComposition3(TestLambdaComposition d) {
        Composition lambda = (int x) -> {
            return d.g_h.apply(d.k2.apply(d.g_h.apply(d.f.apply(x))));  // <=> f ~> g ~> k ~> h
        };
        compositionBlackHole = lambda;
        return lambda.apply(d.i);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(TestLambdaComposition.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}