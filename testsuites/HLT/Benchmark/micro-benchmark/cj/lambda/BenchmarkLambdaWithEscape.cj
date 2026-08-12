/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping --no-sub-pkg %cmp_utest_opt -Woff=all %f -o %output
// RUN-EXEC: %export cjHeapSize=16gb && %export cjStackSize=64mb && %export JETVMPROP="-Xmx16G -Djet.cj.use.fibers -Djet.fiber.stack.size=64M" && %run %run_opt %output %run_utest_opt %run_args --bench --no-color


import std.time.*
import std.collection.*
import std.random.Random


var lambdaBlackHole: (Int64) -> Int64 = { x: Int64 => 5 * x }

var SAMPLES_NUM = 1


@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class TestLambdaWithEscape {
    static var sum = 0

    static var r = Random()

    static func lambdaUse(lambda: (Int64) -> Int64, reps: Int64, condNumber: Int64): Int64 {
        lambdaBlackHole = lambda  // Escape
        if (condNumber <= 42) {
            sum += lambda(reps)
        } else {
            // Execuation will never reach this part, since the non-computable condition is always true.
            let m = UInt64(condNumber)
            let p: UInt64 = 1000 * 1000 * 1000 + 7
            var x = UInt64(condNumber)

            var s = UInt64(0)
            while (true) {
              // Countable loop deoptimization
              s = (s + p) % m
              if (s == 0) {
                break
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
            sum = Int64(x)
        }
        return sum
    }

    @AfterAll
    func blackHoleUse(): Int64 {
        lambdaBlackHole(15)
    }

    @Strategy
    func getConditionNumber(): Int64 {
       r.nextInt64(42)
    }

    @Bench[cond in getConditionNumber]
    func BenchmarkLambdaWithEscape_LambdaWithoutContext_(cond: Int64): Int64 {
        let lambda = { x: Int64 => x + 2 }
        sum += lambdaUse(lambda, SAMPLES_NUM, cond)
        return sum
    }

    @Bench[cond in getConditionNumber]
    func BenchmarkLambdaWithEscape_SpecializedLambdaWithConstantContext_(cond: Int64): Int64 {
        let condition = cond <= 42
        let lambda = { x: Int64 =>
            if (condition) {
                x + 2
            } else {
                x + 3
            }
        }
        sum += lambdaUse(lambda, SAMPLES_NUM, cond)
        return sum
    }

    @Bench[cond in getConditionNumber]
    func BenchmarkLambdaWithEscape_NotSpecializedLambdaWithConstantContext_(cond: Int64): Int64 {
        let a = 5
        let lambda = { x: Int64 =>
            if (x + a > 15) {
                x + 2
            } else {
                x + 3
            }
        }
        sum += lambdaUse(lambda, SAMPLES_NUM, cond)
        return sum
    }

    func prob(n: Int64, limit: Int64): Bool {
      n % 100 < limit
    }

    func factory(n: Int64, propTest: Int64, cond: Int64): (Int64) -> Int64 {
        if (cond <= 42) {
            if (prob(n, propTest)) {
                { x: Int64 => x + 2 }
            } else {
                { x: Int64 => x + 3 }
            }
        } else {
            // Execuation will never reach this part, since the non-computable condition is always true.
            let m = UInt64(cond)
            let p: UInt64 = 1000 * 1000 * 1000 + 7
            var x = UInt64(cond)

            var s = UInt64(0)
            while (true) {
              // Countable loop deoptimization
              s = (s + p) % m
              if (s == 0) {
                break
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
            if (Int64(x) > 0) {
                 return { x: Int64 => x + 2 }
            } else {
                 return { x: Int64 => x + 3 }
            }
        }
    }

    @Bench[reps in [512], cond in getConditionNumber]
    func BenchmarkLambdaWithEscape_LambdaFactory50_(reps: Int64, cond: Int64): Int64 {
        for (i in 0..reps) {
            let lambda = factory(i, 50, cond)
            sum += lambdaUse(lambda, SAMPLES_NUM, cond)
        }
        return sum
    }

    @Bench[reps in [512], cond in getConditionNumber]
    func BenchmarkLambdaWithEscape_LambdaFactory99_(reps: Int64, cond: Int64): Int64 {
        for (i in 0..reps) {
            let lambda = factory(i, 99, cond)
            sum += lambdaUse(lambda, SAMPLES_NUM, cond)
        }
        return sum
    }

    @Bench[reps in [512], cond in getConditionNumber]
    func BenchmarkLambdaWithEscape_LambdaFactory100_(reps: Int64, cond: Int64): Int64 {
        for (i in 0..reps) {
            let lambda = factory(i, 100, cond)
            sum += lambdaUse(lambda, SAMPLES_NUM, cond)
        }
        return sum
    }

    @Bench[reps in [512], cond in getConditionNumber]
    func BenchmarkLambdaWithEscape_LambdaInlinedFactory50_(reps: Int64, cond: Int64): Int64 {
        for (i in 0..reps) {
            let lambda = if (prob(i, 50)) {
                { x: Int64 => x + 2 }
            } else {
                { x: Int64 => x + 3 }
            }
            sum += lambdaUse(lambda, SAMPLES_NUM, cond)
        }
        return sum
    }

    @Bench[reps in [512], cond in getConditionNumber]
    func BenchmarkLambdaWithEscape_LambdaInlinedFactory99_(reps: Int64, cond: Int64): Int64 {
        for (i in 0..reps) {
            let lambda = if (prob(i, 99)) {
                { x: Int64 => x + 2 }
            } else {
                { x: Int64 => x + 3 }
            }
            sum += lambdaUse(lambda, SAMPLES_NUM, cond)
        }
        return sum
    }

    @Bench[reps in [512], cond in getConditionNumber]
    func BenchmarkLambdaWithEscape_LambdaInlinedFactory100_(reps: Int64, cond: Int64): Int64 {
        for (i in 0..reps) {
            let lambda = if (prob(i, 100)) {
                { x: Int64 => x + 2 }
            } else {
                { x: Int64 => x + 3 }
            }
            sum += lambdaUse(lambda, SAMPLES_NUM, cond)
        }
        return sum
    }
}
