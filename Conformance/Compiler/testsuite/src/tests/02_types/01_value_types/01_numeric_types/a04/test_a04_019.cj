/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a04_019

  @Level:         1

  @Assertion:   2.1.1(4) Unsigned integer types include UInt8, UInt16, UInt32, UInt64 and
                UIntNative, which are types of unsigned integer values encoded with 8-bit,
                16-bit, 32-bit, 64-bit and platform dependent size, respectively.

  @Description: Checks that:
                - variable declared with unsigned integer type UIntNative can be assigned by 
                  value, whose length is equal to length of UIntNative;
                - variable declared with unsigned integer type UIntNative cannot be assigned by 
                  value, whose length is greater than length of UIntNative;

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/

import utils.assert.Assert

func getUIntNativeSize
    (one: UIntNative, shift7: UInt8,  shift15: UInt8,  shift31: UInt8,  shift63: UInt8): UInt64 
{
    var size: UInt64 = 0;

    var uint_native_var: UIntNative = 0;
    try {
        uint_native_var = one << shift7;
        size = 8;

        uint_native_var = one << shift15;
        size = 16;

        uint_native_var = one << shift31;
        size = 32;

        uint_native_var = one << shift63;
        size = 64;
    } catch (e: ArithmeticException) {
        //println(e.toString());
        // OK        
    } catch (e: Exception) {
        //println(e.toString());
        // not OK        
        size = 0;
    }

    //print("The size of UIntNative is ");
    //println(size);
    return size;
}

main() {
    var size_of_UIntNative: UInt64 = getUIntNativeSize(1, 7, 15, 31, 63);

//Test_case_1
    Assert.notEquals(0, size_of_UIntNative, 
        reason:"""
Test_case_1: Calculated size of UIntNative is not correct.
""");

    var uintNative_var_01: UIntNative = (1 << (size_of_UIntNative - 1));
    var expected_uintNative_var: UIntNative = 0;
    if (size_of_UIntNative == 8) {
        expected_uintNative_var = 128;
    }

    if (size_of_UIntNative == 16) {
        expected_uintNative_var = 32768;
    }

    if (size_of_UIntNative == 32) {
        expected_uintNative_var = 2147483648;
    }

    if (size_of_UIntNative == 64) {
        expected_uintNative_var = 9223372036854775808;
    }

//Test_case_2
    Assert.equals(expected_uintNative_var, uintNative_var_01, 
        reason:"""
Test_case_2: UIntNative value, calculated as 1 shifted left 
by calculated size of UIntNative, is not correcti.
""");

//Test_case_3
   var is_failed: Bool = false;
   var error_reason: String = "";
    var intNative_var_02: UIntNative = 0;
    try {
        intNative_var_02 = 1 << size_of_UIntNative;
        is_failed = true;
        error_reason = 
"""
Test_case_3: Variable of UIntNative type is assigned successfully
by value, whose length is greater than length of UIntNative. 
""";
    } catch (e: ArithmeticException) {
        // OK        
        //println(e.toString());
    } catch (e: Exception) {
        // not OK        
        //println(e.toString());
        is_failed = true;
        error_reason = 
"""
Test_case_3: Try to assign variable of UIntNative type 
by value, whose length is greater than length of UIntNative,
causes unexpected Exception: 

""" + e.toString();
    }

    Assert.equals(false, is_failed, 
        reason: error_reason);

    return 0;
}


