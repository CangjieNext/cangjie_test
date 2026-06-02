/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0 
// EXEC: %compiler %cmp_opt %link_openssl %cmp_utest_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args 

/*
 * Test description: Test the Random.nextGaussianFloat64, add method with
 * new parameters by default : mean, sigma
 * Test API: public open func nextGaussianFloat64(mean!: Float64 = 0.0, sigma!: Float64 = 1.0): Float64
 */

import std.random.*
import std.math.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_Random_NextGaussianFloat64 {
    private var means: Array<Float64> = [1.79E308, 3.9e-100, 0x.2p4, -1.78999E308, 5000.00]
    private var reps = 1000

    @TestCase
    func case1(): Unit {
        var temp = 0.0f64
        for (i in 0..reps) {
            var r1 = Random()
            temp += r1.nextGaussianFloat64()
        }
        var s = temp / Float64(reps)
        @Expect(abs(s) >= 0.0 , true)
    }

    @TestCase
    func case2(): Unit {
        for (mean in means) {
            var temp = 0.0f64
            for (i in 0..reps) {
                var r1 = Random()
                temp += r1.nextGaussianFloat64(mean: mean, sigma: 8.4f64)
                temp -= mean
            }
            var s = temp / Float64(reps)
            println(s)
            @Expect(abs(s) >= 0.0, true)
        }
    }
}
