/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a05_04

  @Level:         1

  @Assertion:   2.1.1(5) Floating-point types include Float16, Float32, and Float64, which are
                types for floating-point numbers with encoding lengths of 16-bit, 32-bit, and
                64-bit, respectively.

  @Description: Checks that:
                - minimal value of Floating-point type Float16 takes 16 bits;
                - maximal value of Floating-point type Float16 takes less thah 16 bits;

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/

import utils.assert.Assert

main() {
    //Test case 1
    var f16Min1: Float16 = Float16.Min;
    var f16Min2: Float16 = -6.55e4; // 0xFBFF
    Assert.equals(f16Min2, f16Min1, 
        reason: """
Test case 1: A variable, declared with type Float16
and assigned by minimal floating-point value of type Float16, 
has unexpected value.
""");

    //Test case 2
    var f16Max1: Float16 = Float16.Max;
    var f16Max2: Float16 = 6.55e4; // 0x7BFF
    Assert.equals(f16Max2, f16Max1, 
        reason: """
Test case 2: A variable, declared with type Float16
and assigned by maximal floating-point value of type Float16, 
has unexpected value.
""");

    return 0;
}

