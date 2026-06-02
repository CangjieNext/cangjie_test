/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a18_02

  @Level:         1

  @Assertion:   2.1.1(18) Float64 See IEEE 754 binary64 format

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
    var f64Var01: Float64 = 0x1.0p1024; //0x7FF0000000000000
    var f64PosInf: Float64 = Float64.Inf; //may be Float64.POSITIVE_INFINITY instead: see 0006075
    Assert.equals(f64PosInf, f64Var01, 
        reason: """
Test case 1: A variable, declared with type Float64
and assigned by positive floating-point value of type Float64,
which have all bits of its exponent equal to 1,  
has value different from Float64 positive infinity.
""");

    //Test case 2
    var f64Var02: Float64 = -0x1.0p1024; //0xFFF0000000000000
    var f64NegInf: Float64 = -Float64.Inf; //may be Float64.NEGATIVE_INFINITY instead: see 0006075
    Assert.equals(f64NegInf, f64Var02, 
        reason: """
Test case 2: A variable, declared with type Float64
and assigned by negative floating-point value of type Float64,
which have all bits of its exponent equal to 1,  
has value different from Float64 negative infinity.
""");

    return 0;
}

