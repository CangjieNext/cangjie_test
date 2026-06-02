/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a18_01

  @Level:         1

  @Assertion:   2.1.1(18) Float64 See IEEE 754 binary64 format

  @Description: Checks that various values of Floating-point type Float64,
                including Float64 minimal and maximal values, have length 
                not greater than 64 bits;

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/

import utils.assert.Assert

main() {
    //Test case 1
    var f64Min1: Float64 = Float64.Min;
    var f64Min2: Float64 = -1.7976931348623157e308; // 0xFFEFFFFFFFFFFFFF
    Assert.equals(f64Min2, f64Min1, 
        reason: """
Test case 1: A variable, declared with type Float64
and assigned by minimal floating-point value of type Float64, 
has unexpected value.
""");

    //Test case 2
    var f64Max1: Float64 = Float64.Max;
    var f64Max2: Float64 = 1.7976931348623157e308; // 0x7FEFFFFFFFFFFFFF
    Assert.equals(f64Max2, f64Max1, 
        reason: """
Test case 2: A variable, declared with type Float64
and assigned by maximal floating-point value of type Float64, 
has unexpected value.
""");

    //Test case 3
    var f64Var31: Float64 = 999999999999999939709166371603178586112.0;
    var f64Var32: Float64 = 1.0E39; // 0x48078287F49C4A1D
    Assert.equals(f64Var32, f64Var31, 
        reason: """
Test case 3: A variable, declared with type Float64
and assigned by some positive floating-point value of type Float64, 
has unexpected value.
""");

    //Test case 4
    var f64Var41: Float64 = -999999999999999939709166371603178586112.0;
    var f64Var42: Float64 = -1.0E39; // 0xC8078287F49C4A1D
    Assert.equals(f64Var42, f64Var41, 
        reason: """
Test case 4: A variable, declared with type Float64
and assigned by some negative floating-point value of type Float64, 
has unexpected value.
""");

    return 0;
}

