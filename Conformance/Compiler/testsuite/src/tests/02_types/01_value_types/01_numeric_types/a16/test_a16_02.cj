/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a16_02

  @Level:         1

  @Assertion:   2.1.1(16) Float16 See IEEE 754 binary16 format

  @Description: Checks that, according to the IEEE 754 standard, a floating-point number 
                with all exponent bits equal to 1 is infinity.

  @Mode:        run

  @Negative:    no

  @CompileWarning: Ignore
  
  @Structure:   single

  @Issue:       0006075

*/

import utils.assert.Assert

main() {
    //Test case 1
    var f16Var01: Float16 = 0x1.0p16; //0x7C00;
    var f16PosInf: Float16 = Float16.Inf; //may be Float16.POSITIVE_INFINITY instead: see 0006075
    Assert.equals(f16PosInf, f16Var01, 
        reason: """
Test case 1: A variable, declared with type Float16
and assigned by positive floating-point value of type Float16,
which have all bits of its exponent equal to 1,  
has value different from Float16 positive infinity.
""");

    //Test case 2
    var f16Var02: Float16 = -0x1.0p16; //0xFC00;
    var f16NegInf: Float16 = -Float16.Inf; //may be Float16.NEGATIVE_INFINITY instead: see 0006075
    Assert.equals(f16NegInf, f16Var02, 
        reason: """
Test case 2: A variable, declared with type Float16
and assigned by negative floating-point value of type Float16,
which have all bits of its exponent equal to 1,  
has value different from Float16 negative infinity.
""");

    return 0;
}

