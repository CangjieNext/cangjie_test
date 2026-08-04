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
import java.util.Random;

@BenchmarkMode(Mode.AverageTime)
@Warmup(iterations = 1, time = 1)
@OutputTimeUnit(TimeUnit.NANOSECONDS)
@Measurement(iterations = 1)
@State(Scope.Benchmark)
@Fork(1)
public class TestLambdaWithEscape {
    interface L {
        Integer apply(Integer a);
    }

    static L lambdaBlackHole = (x) -> 5;

    @Param({"512"})
    public int reps;

    static boolean c = true;

    static long sum = 0;

    Random rand;

    static int conditionNumber;

    static int SAMPLES_NUM = 1;

    static long lambdaUse(L lambda, int reps, int condNumber) {
        lambdaBlackHole = lambda;  // Escape

        if (condNumber <= 42) {
            sum += lambda.apply(reps);
        } else {
            // Execuation will never reach this part, since the non-computable condition is always true.
            long m = condNumber;
            long p = 1000 * 1000 * 1000 + 7;
            long x = condNumber;

            long s = 0;
            while (true) {
                // Countable loop deoptimization
                s = (s + p) % m;
                if (s == 0) {
                    break;
                }


                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;
            }
            sum = x;
        }
        return sum;
    }

    @Setup(Level.Trial)
    public void setUp() {
        rand = new Random();
    }

    @Setup(Level.Iteration)
    public void setUpIteration() {
        conditionNumber = rand.nextInt(42);
    }

    @Benchmark
    public long TestLambdaWithEscape_LambdaWithoutContext(TestLambdaWithEscape d) {
        L lambda = (x) -> x + 2;
        sum += lambdaUse(lambda, SAMPLES_NUM, d.conditionNumber);
        return sum;
    }

    @Benchmark
    public long TestLambdaWithEscape_SpecializedLambdaWithConstantContext(TestLambdaWithEscape d) {
        boolean cond = d.conditionNumber <= 42;
        L lambda = (x) -> {
            if (cond) {
                return x + 2;
            } else {
                return x + 3;
            }
        };
        sum += lambdaUse(lambda, SAMPLES_NUM, d.conditionNumber);
        return sum;
    }


    @Benchmark
    public long TestLambdaWithEscape_NotSpecializedLambdaWithConstantContext(TestLambdaWithEscape d) {
        int a = 5;
        L lambda = (x) -> {
            if (x + a > 15) {
                return x + 2;
            } else {
                return x + 3;
            }
        };
        sum += lambdaUse(lambda, SAMPLES_NUM, d.conditionNumber);
        return sum;
    }

    boolean prob(int n, int limit) {
        return n % 100 < limit;
    }

    L factory(int n, int propTest, int cond) {
        if (cond <= 42) {
            if (prob(n, propTest)) {
                return (x) -> x + 2;
            } else {
                return (x) -> x + 3;
            }
        } else {
            // Execuation will never reach this part, since the non-computable condition is always true.
            long m = cond;
            long p = 1000 * 1000 * 1000 + 7;
            long x = cond;

            long s = 0;
            while (true) {
                // Countable loop deoptimization
                s = (s + p) % m;
                if (s == 0) {
                    break;
                }


                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;

                x ^= x << 13;
                x ^= x >> 7;
                x ^= x << 17;
            }
            if (x > 0) {
                return (y) -> y + 2;
            } else {
                return (y) -> y + 3;
            }
        }
    }

    @Benchmark
    public long TestLambdaWithEscape_Factory50(TestLambdaWithEscape d) {
        for (int i = 0; i < d.reps; i++) {
            L lambda = factory(i, 50, d.conditionNumber);
            sum += lambdaUse(lambda, SAMPLES_NUM, d.conditionNumber);
        }
        return sum;
    }

    @Benchmark
    public long TestLambdaWithEscape_Factory99(TestLambdaWithEscape d) {
        for (int i = 0; i < d.reps; i++) {
            L lambda = factory(i, 99, d.conditionNumber);
            sum += lambdaUse(lambda, SAMPLES_NUM, d.conditionNumber);
        }
        return sum;
    }

    @Benchmark
    public long TestLambdaWithEscape_Factory100(TestLambdaWithEscape d) {
        for (int i = 0; i < d.reps; i++) {
            L lambda = factory(i, 100, d.conditionNumber);
            sum += lambdaUse(lambda, SAMPLES_NUM, d.conditionNumber);
        }
        return sum;
    }

    @Benchmark
    public long TestLambdaWithEscape_InlinedFactory50(TestLambdaWithEscape d) {
        for (int i = 0; i < d.reps; i++) {
            L lambda;
            if (prob(i, 50)) {
                lambda = (x) -> x + 2;
            } else {
                lambda = (x) -> x + 3;
            }
            sum += lambdaUse(lambda, SAMPLES_NUM, d.conditionNumber);
        }
        return sum;
    }

    @Benchmark
    public long TestLambdaWithEscape_InlinedFactory99(TestLambdaWithEscape d) {
        for (int i = 0; i < d.reps; i++) {
            L lambda;

            if (prob(i, 99)) {
                lambda = (x) -> x + 2;
            } else {
                lambda = (x) -> x + 3;
            }
            sum += lambdaUse(lambda, SAMPLES_NUM, d.conditionNumber);
        }
        return sum;
    }

    @Benchmark
    public long TestLambdaWithEscape_InlinedFactory100(TestLambdaWithEscape d) {
        for (int i = 0; i < d.reps; i++) {
            L lambda;
            if (prob(i, 100)) {
                lambda = (x) -> x + 2;
            } else {
                lambda = (x) -> x + 3;
            }
            sum += lambdaUse(lambda, SAMPLES_NUM, d.conditionNumber);
        }
        return sum;
    }

    public static void main(String[] args) throws RunnerException {
        Options opt = new OptionsBuilder()
                .include(TestLambdaWithEscape.class.getSimpleName())
                .forks(1)
                .build();
        new Runner(opt).run();
    }
}