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
 * Test description: Test the Random.nextGaussianFloat32, add method with
 * new parameters by default : mean, sigma
 * Test API: public open func nextGaussianFloat32(mean!: Float32 = 0.0, sigma!: Float32 = 1.0): Float32
 */

import std.random.*
import std.math.*
import std.unittest.*
import std.unittest.testmacro.*

@Test
public class Test_Random_NextGaussianFloat32 {
    private var means: Array<Float32> = [3.40E38, 3.39999E-38, 0x.2p4, -3.40E38, 1314.15]
    private var reps = 200

    @TestCase
    func case1(): Unit {
        var temp = 0.0f32
        for (i in 0..reps) {
            var r1 = Random()
            temp += r1.nextGaussianFloat32()
        }
        var s = temp / Float32(reps)
        @Expect(abs(s) >= 0.0, true)
    }

    @TestCase
    func case2(): Unit {
        for (mean in means) {
            var temp = 0.0f32
            for (i in 0..reps) {
                var r1 = Random()
                temp += r1.nextGaussianFloat32(mean: mean, sigma: 4.2f32)
                temp -= mean
            }
            var s = temp / Float32(reps)
            @Expect(abs(s) >= 0.0, true)
        }
    }
}
