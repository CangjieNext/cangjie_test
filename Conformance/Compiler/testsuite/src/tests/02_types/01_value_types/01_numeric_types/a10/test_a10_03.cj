/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a10_03

  @Level:         1

  @Assertion:   2.1.1(10) IntNative platform dependent

  @Description: Checks that variable declared with integer type IntNative cannot be assigned 
                by value that is greater than maximal IntNative value;

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

func getCorrection(): IntNative {
    return 1;
}

main() {
    var sizeOfIntNative: Int64 = getIntNativeSize();
    //Test case 1
    Assert.notEquals(0, sizeOfIntNative, 
        reason: """
Test case 1: Calculated size of IntNative is not correct.
""");

    var passed: Bool = true;
    var failReason: String = String.empty;

    var failReason01: String = """
Variable of type IntNative 
is assigned by value greater than possible maximal value: """;

    var failReason02: String = """
An attempt to assign a value 
greater than possible maximal value
to a variable of type IntNative results in unexpected Exception:
""";

    //Test case 2
    if (sizeOfIntNative == 8) {
        try 
        {
            //Expected: "OverflowException: add"
            let intVar: IntNative = 127 + getCorrection();
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
    if (sizeOfIntNative == 16) {
        try 
        {
            //Expected:  "OverflowException: add"
            let intVar: IntNative = 32767 + getCorrection();
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
    if (sizeOfIntNative == 32) {
        try 
        {
            //Expected: "OverflowException: add"
            let intVar: IntNative = 2147483647 + getCorrection();
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
    if (sizeOfIntNative == 64) {
        try 
        {
            //Expected: "OverflowException: add"
            let intVar: IntNative = 9223372036854775807 + getCorrection();
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

