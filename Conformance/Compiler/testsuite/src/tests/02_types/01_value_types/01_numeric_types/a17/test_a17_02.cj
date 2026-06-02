/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a17_02

  @Level:         1

  @Assertion:   2.1.1(17) Float32 See IEEE 754 binary32 format

  @Description: Checks that, according to the IEEE 754 standard, a floating-point number 
                with all exponent bits equal to 1 is infinity.

  @Mode:        run

  @Negative:    no

  @CompileWarning: yes
  
  @Structure:   single

  @Issue:       0006075


*/

import utils.assert.Assert

main() {
    //Test case 1
    var f32Var01: Float32 = 0x1.0p128; //0x7F800000
    var f32PosInf: Float32 = Float32.Inf; //may be Float32.POSITIVE_INFINITY instead: see 0006075
    Assert.equals(f32PosInf, f32Var01, 
        reason: """
Test case 1: A variable, declared with type Float32
and assigned by positive floating-point value of type Float32,
which have all bits of its exponent equal to 1,  
has value different from Float32 positive infinity.
""");

    //Test case 2
    var f32Var02: Float32 = -0x1.0p128; //0xFF800000
    var f32NegInf: Float32 = -Float32.Inf; //may be Float32.NEGATIVE_INFINITY instead: see 0006075
    Assert.equals(f32NegInf, f32Var02, 
        reason: """
Test case 2: A variable, declared with type Float32
and assigned by negative floating-point value of type Float32,
which have all bits of its exponent equal to 1,  
has value different from Float32 negative infinity.
""");

    return 0;
}

