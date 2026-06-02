/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a18_04

  @Level:         1

  @Assertion:   2.1.1(18) Float64 See IEEE 754 binary64 format

  @Description: Checks that some operations with Float64.NaN results in Float64.NaN;

  @Mode:        run

  @Negative:    no

  @Structure:   single

  @Issue:       0006075


*/

import utils.assert.Assert

main() {
    //Test case 1
    var f64Var01: Float64 =  Float64.NaN + 1.0;;
    
    var isNaN01: Bool = false;
    try {
        // Expected: "OverflowException: Casting NaN value to integer."
        var i64: Int64 = Int64(f64Var01);
    } catch (e: OverflowException) {
        isNaN01 = e.toString()[19..35] == "Casting Infinite";
    } catch (e: Exception) {
    }

    Assert.equals(true, isNaN01, 
        reason: """
Test case 1: Result Of 'Add' operation 
with Float64.NaN and 1.0 has value different 
from expected Float64.NaN.
""");

    //Test case 2
    var f64Var02: Float64 = Float64.NaN - 1.0;
    var isNaN02: Bool = false;
    try {
        var i64: Int64 = Int64(f64Var02);
    } catch (e: OverflowException) {
        isNaN02 = e.toString()[19..35] == "Casting Infinite";
    } catch (e: Exception) {
    }

    Assert.equals(true, isNaN02, 
        reason: """
Test case 2: Result Of 'Subtract' operation 
with Float64.NaN and 1.0 has value different 
from expected Float64.NaN.

""");

    //Test case 3
    var f64Var03: Float64 = Float64.NaN / 1.0;
    var isNaN03: Bool = false;
    try {
        var i64: Int64 = Int64(f64Var03);
    } catch (e: OverflowException) {
        isNaN03 = e.toString()[19..35] == "Casting Infinite";
    } catch (e: Exception) {
    }

    Assert.equals(true, isNaN03, 
        reason: """
Test case 3: Result Of 'Divide' operation 
with Float64.NaN and 1.0 has value different 
from expected Float64.NaN.
""");

    //Test case 4
    var f64Var04: Float64 = Float64.NaN * 1.0;
    var isNaN04: Bool = false;
    try {
        var i64: Int64 = Int64(f64Var04);
    } catch (e: OverflowException) {
        isNaN04 = e.toString()[19..35] == "Casting Infinite";
    } catch (e: Exception) {
    }

    Assert.equals(true, isNaN04, 
        reason: """
Test case 4: Result Of 'Multiply' operation 
with Float64.NaN and 1.0 has value different 
from expected Float64.NaN.
""");

    return 0;
}

