/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a16_04

  @Level:         1

  @Assertion:   2.1.1(16) Float16 See IEEE 754 binary16 format

  @Description: Checks that some operations with Float16.NaN results in Float16.NaN;

  @Mode:        run

  @Negative:    no

  @Structure:   single

  @Issue:       0006075


*/

import utils.assert.Assert

main() {
    //Test case 1
    var f16Var01: Float16 =  Float16.NaN + 1.0;;
    var isNaN01: Bool = false;
    try {
        // Expected: "OverflowException: Casting NaN value to integer."
        var i16: Int16 = Int16(f16Var01);

    } catch (e: OverflowException) {
        isNaN01 = e.toString()[19..35] == "Casting Infinite";
    } catch (e: Exception) {
    }

    Assert.equals(true, isNaN01, 
        reason: """
Test case 1: Result Of 'Add' operation 
with Float16.NaN and 1.0 has value different 
from expected Float16.NaN.
""");

    //Test case 2
    var f16Var02: Float16 = Float16.NaN - 1.0;
    var isNaN02: Bool = false;
    try {
        var i16: Int16 = Int16(f16Var02);

    } catch (e: OverflowException) {
        isNaN02 = e.toString()[19..35] == "Casting Infinite";
    } catch (e: Exception) {
    }

    Assert.equals(true, isNaN02, 
        reason: """
Test case 2: Result Of 'Subtract' operation 
with Float16.NaN and 1.0 has value different 
from expected Float16.NaN.

""");

    //Test case 3
    var f16Var03: Float16 = Float16.NaN / 1.0;
    var isNaN03: Bool = false;
    try {
        var i16: Int16 = Int16(f16Var03);
    } catch (e: OverflowException) {
        isNaN03 = e.toString()[19..35] == "Casting Infinite";
    } catch (e: Exception) {
    }

    Assert.equals(true, isNaN03, 
        reason: """
Test case 3: Result Of 'Divide' operation 
with Float16.NaN and 1.0 has value different 
from expected Float16.NaN.
""");

    //Test case 4
    var f16Var04: Float16 = Float16.NaN * 1.0;
    var isNaN04: Bool = false;
    try {
        var i16: Int16 = Int16(f16Var04);
    } catch (e: OverflowException) {
        isNaN04 = e.toString()[19..35] == "Casting Infinite";
    } catch (e: Exception) {
    }

    Assert.equals(true, isNaN04, 
        reason: """
Test case 4: Result Of 'Multiply' operation 
with Float16.NaN and 1.0 has value different 
from expected Float16.NaN.
""");

    return 0;
}

