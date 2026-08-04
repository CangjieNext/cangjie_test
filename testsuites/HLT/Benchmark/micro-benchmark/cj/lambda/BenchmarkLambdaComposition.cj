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

@Test
@Configure[minDuration: Duration.second * 3]
@Measure[TimeNow(Nanos)]
@Configure[warmup: Duration.second]
public class TestLambdaComposition {

    static var lambdaBlackHole: (Int32) -> Int64 = { x: Int32 => 5 }

    static let f = { x: Int32 =>  Float64(x) * 0.5 }
    static let g_h = { x: Float64 => Int64(x) }
    static let k1 = { x: Int64 => x + 2 }
    static let k2 = { x: Int64 => Float64(x) * 2.25 }

    @Bench[i in [512]]
    func BenchmarkLambdaComposition_(i: Int32): Int64 {
        let lambda = f ~> g_h
        lambdaBlackHole = lambda
        lambda(i)
    }

    @Bench[i in [512]]
    func BenchmarkLambdaComposition2_(i: Int32): Int64 {
        let lambda = f ~> g_h ~> k1
        lambdaBlackHole = lambda
        lambda(i)
    }

    @Bench[i in [512]]
    func BenchmarkLambdaComposition3_(i: Int32): Int64 {
        let lambda = f ~> g_h ~> k2 ~> g_h
        lambdaBlackHole = lambda
        lambda(i)
    }
}
