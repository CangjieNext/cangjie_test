/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a15_03

  @Level:         1

  @Assertion:   2.1.1(15) UIntNative platform dependent

  @Description: Checks that variable declared with integer type UIntNative cannot be assigned 
                by value that is greater than maximal UIntNative value;

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/

import utils.assert.Assert

func getUIntNativeSize
    (one: UIntNative, shift7: UInt8,  shift15: UInt8,  shift31: UInt8,  shift63: UInt8): UInt64 
{
    var size: UInt64 = 0;

    var uintNativeVar: UIntNative = 0;
    try {
        uintNativeVar = one << shift7;
        size = 8;

        uintNativeVar = one << shift15;
        size = 16;

        uintNativeVar = one << shift31;
        size = 32;

        uintNativeVar = one << shift63;
        size = 64;
    } catch (e: ArithmeticException) {
        // OK        
    } catch (e: Exception) {
        // not OK        
        size = 0;
    }

    return size;
}

func getCorrection(): UIntNative {
    return 1;
}

main() {
    var sizeOfUIntNative: UInt64 = getUIntNativeSize(1, 7, 15, 31, 63);

    //Test case 1
    Assert.notEquals(0, sizeOfUIntNative, 
        reason: """
Test case 1: Calculated size of UIntNative is not correct.
""");

    var passed: Bool = true;
    var failReason: String = String.empty;

    var failReason01: String = """
Variable of type UIntNative 
is assigned by value greater than possible maximal value: """;

    var failReason02: String = """
An attempt to assign a value 
greater than possible maximal value
to a variable of type UIntNative results in unexpected Exception:
""";

    //Test case 2
    if (sizeOfUIntNative == 8) {
        try 
        {
            //Expected: "OverflowException: add"
            let intVar: UIntNative = 255 + getCorrection();
            passed = false;
            failReason = """
${"Test case 2: " + failReason01 + intVar.toString()}""";
        } catch (e: OverflowException) {
            // OK        
        } catch (e: Exception) {
            // not OK        
            passed = false;
            failReason = """
${"Test case 2: " + failReason02 + e.toString()}""";
        }
    }

    //Test case 3
    if (sizeOfUIntNative == 16) {
        try 
        {
            //Expected: "OverflowException: add"
            let intVar: UIntNative = 65535 + getCorrection();
            passed = false;
            failReason = """
${"Test case 3: " + failReason01 + intVar.toString()}""";
        } catch (e: OverflowException) {
            // OK        
        } catch (e: Exception) {
            // not OK        
            passed = false;
            failReason = """
${"Test case 3: " + failReason02 + e.toString()}""";
        }
    }

    //Test case 4
    if (sizeOfUIntNative == 32) {
        try 
        {
            //Expected: "OverflowException: add"
            let intVar: UIntNative = 4294967295 + getCorrection();
            passed = false;
            failReason = """
${"Test case 4: " + failReason01 + intVar.toString()}""";
        } catch (e: OverflowException) {
            // OK        
        } catch (e: Exception) {
            // not OK        
            passed = false;
            failReason = """
${"Test case 4: " + failReason02 + e.toString()}""";
        }
    }

    //Test case 5
    if (sizeOfUIntNative == 64) {
        try 
        {
            //Expected: "OverflowException: add"
            let intVar: UIntNative = 18446744073709551615 + getCorrection();
            passed = false;
            failReason = """
${"Test case 5: " + failReason01 + intVar.toString()}""";
        } catch (e: OverflowException) {
            // OK        
        } catch (e: Exception) {
            // not OK        
            passed = false;
            failReason = """
${"Test case 5: " + failReason02 + e.toString()}""";
        }
    }

    Assert.equals(true, passed, reason: failReason);

    return 0;
}

