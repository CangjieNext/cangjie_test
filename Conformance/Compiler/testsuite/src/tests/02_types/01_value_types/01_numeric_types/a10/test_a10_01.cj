/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a10_01

  @Level:         1

  @Assertion:   2.1.1(10) IntNative platform dependent

  @Description: Checks that variable declared with integer type IntNative can be assigned 
                by minimal and maximal values;

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/

import utils.assert.Assert

func getIntNativeSize(): Int64 {

    var size: Int64 = 0;
    try {
        var intVar64: Int64 = -128;
        var intVarNative: IntNative = IntNative(intVar64);
        size = 8;

        intVar64 = -32768; 
        intVarNative = IntNative(intVar64);
        size = 16;

        intVar64 = -2147483648; 
        intVarNative = IntNative(intVar64);
        size = 32;

        intVar64 = -9223372036854775808; 
        intVarNative = IntNative(intVar64);
        size = 64;
    } catch (e: OverflowException) {
        // OK        
    } catch (e: Exception) {
        // not OK        
        size = 0;
    }

    return size;
}

main() {
    var sizeOfIntNative: Int64 = getIntNativeSize();
    //Test case 1
    Assert.notEquals(0, sizeOfIntNative, 
        reason: """
Test case 1: Calculated size of IntNative is not correct.
""");


    //Test case 2
    var minimalIntNativeValue: IntNative = 0;

    if (sizeOfIntNative == 8) {
        minimalIntNativeValue = -128;
    }

    if (sizeOfIntNative == 16) {
        minimalIntNativeValue = -32168;
    }

    if (sizeOfIntNative == 32) {
        minimalIntNativeValue = -2147483648;
    }

    if (sizeOfIntNative == 64) {
        minimalIntNativeValue = -9223372036854775808;
    }

    let intVar01: IntNative = minimalIntNativeValue;
    Assert.equals(minimalIntNativeValue, intVar01, 
        reason: """
Test case 2: A variable, declared with type IntNative
and assigned by minimal IntNative value, has unexpected value.
""");

    //Test case 3
    var maximalIntNativeValue: IntNative = 0;

    if (sizeOfIntNative == 8) {
        maximalIntNativeValue = 127;
    }

    if (sizeOfIntNative == 16) {
        maximalIntNativeValue = 32767;
    }

    if (sizeOfIntNative == 32) {
        maximalIntNativeValue = 2147483647;
    }

    if (sizeOfIntNative == 64) {
        maximalIntNativeValue = 9223372036854775807;
    }

    let intVar02: IntNative = maximalIntNativeValue;
    Assert.equals(maximalIntNativeValue, intVar02, 
        reason: """
Test case 3: A variable, declared with type IntNative
and assigned by maximal IntNative value, has unexpected value.
""");

    return 0;
}

