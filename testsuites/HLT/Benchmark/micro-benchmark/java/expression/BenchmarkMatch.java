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
public class BenchmarkMatch {
    static int a = 16;
    static double b = 0.0d;

    @Benchmark
    public void BenchmarkMatchD1(Blackhole blackhole) {
        switch (a) {
            case 1 :
                b = 1.5d;
                break;
            case 2 :
                b = 2.5d;
                break;
            case 3 :
                b = 3.5d;
                break;
            case 4 :
                b = 4.5d;
                break;
            case 5 :
                b = 5.5d;
                break;
            case 6 :
                b = 6.5d;
                break;
            case 7 :
                b = 7.5d;
                break;
            case 8 :
                b = 8.5d;
                break;
            case 9 :
                b = 9.5d;
                break;
            case 10 :
                b = 10.5d;
                break;
            case 11 :
                b = 11.5d;
                break;
            case 12 :
                b = 12.5d;
                break;
            case 13 :
                b = 13.5d;
                break;
            case 14 :
                b = 14.5d;
                break;
            case 15 :
                b = 15.5d;
                break;
            default :
                b = 16.5d;
                break;
        };
        blackhole.consume(a);
        blackhole.consume(b);
    }

    @Benchmark
    public void BenchmarkMatchD2(Blackhole blackhole) {
        switch (a) {
            case 1 :
                b = 1.5d;
                break;
            case 2 :
                b = 2.5d;
                break;
            case 3 :
                b = 3.5d;
                break;
            case 4 :
                b = 4.5d;
                break;
            case 5 :
                b = 5.5d;
                break;
            case 6 :
                b = 6.5d;
                break;
            case 7 :
                b = 7.5d;
                break;
            case 8 :
                b = 8.5d;
                break;
            case 9 :
                b = 9.5d;
                break;
            case 10 :
                b = 10.5d;
                break;
            case 11 :
                b = 11.5d;
                break;
            case 12 :
                b = 12.5d;
                break;
            case 13 :
                b = 13.5d;
                break;
            case 14 :
                b = 14.5d;
                break;
            default :
                switch (a) {
                    case 15 :
                        b = 15.5d;
                        break;
                    default :
                        b = 16.6d;
                        break;
                };
        };
        blackhole.consume(a);
        blackhole.consume(b);
    }

    @Benchmark
    public void BenchmarkMatchD4(Blackhole blackhole) {
        switch (a) {
            case 1 :
                b = 1.5d;
                break;
            case 2 :
                b = 2.5d;
                break;
            case 3 :
                b = 3.5d;
                break;
            case 4 :
                b = 4.5d;
                break;
            case 5 :
                b = 5.5d;
                break;
            case 6 :
                b = 6.5d;
                break;
            case 7 :
                b = 7.5d;
                break;
            case 8 :
                b = 8.5d;
                break;
            case 9 :
                b = 9.5d;
                break;
            case 10 :
                b = 10.5d;
                break;
            case 11 :
                b = 11.5d;
                break;
            case 12 :
                b = 12.5d;
                break;
            case 13 :
                b = 13.5d;
                break;
            case 14 :
                b = 14.5d;
                break;
            default :
                switch (a) {
                    default :
                        switch (a) {
                            default :
                                switch (a) {
                                    default :
                                        b = 15.5d;
                                        break;
                                };
                        };
                };
        };
        blackhole.consume(a);
        blackhole.consume(b);
    }

    public enum Month {
        JANUARY,
        FEBRUARY,
        MARCH,
        APRIL,
        MAY,
        JUNE,
        JULY,
        AUGUST,
        SEPTEMBER,
        OCTOBER,
        NOVEMBER,
        DECEMBER
    }

    static Month month = Month.DECEMBER;

    @Benchmark
    public void BenchmarkMatchD6(Blackhole blackhole) {
        switch (month) {
            case JANUARY :
                b = 1;
            case FEBRUARY :
                b = 2;
            case MARCH :
                b = 3;
            case APRIL :
                b = 4;
            case MAY :
                b = 5;
            case JUNE :
                b = 6;
            case JULY :
                b = 7;
            case AUGUST :
                b = 8;
            case SEPTEMBER :
                b = 9;
            case OCTOBER :
                b = 10;
            case NOVEMBER :
                b = 11;
            case DECEMBER :
                b = 12;
        };
        blackhole.consume(b);
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(BenchmarkMatch.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}
