/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a08_007

  @Level:         1

  @Assertion:    2(8) Thus, when a variable is used in assignments and passed as a 
                 function parameter in a function call, its value is copied 
                 if it is of a value type and its reference is copied if it is of a reference type.

  @Description:  Checks that:
                 - variable of type 'UInt16', used in assignment, 
                   is assigned to another variable by value,
                   what is correct for 'value type': UInt16.
                 - variable of type 'UInt16', used as function parameter, 
                   is passed to function by value, what is correct for 'value type': UInt16.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

var func_param: UInt16 = 0;
var func_param_copy: UInt16 = 0;

func testFunc(param: UInt16, to_do: Int8): Bool{
    if (to_do == 1){
        func_param_copy = param;
        return true;
    }

    if (to_do == 2){
        if (func_param_copy == param){
            return false;
        }
    }

    return true;
}

main() {
//Test_case_1
    var sourceVar: UInt16 = 55555;
    var targetVar: UInt16 = sourceVar;
    sourceVar = 44444;
    Assert.equals(55555, targetVar, 
        reason:"""
Test_case_1: A variable of type 'UInt16', used in assignment, 
is assigned to another variable not by value.
It is not correct for 'value type': UInt16.
""");

//Test_case_2
    func_param = 0;
    testFunc(func_param, 1);
    func_param = 3;
    Assert.equals(true, testFunc(func_param, 2), 
        reason:"""
Test_case_2: A variable of type 'UInt16', used as function parameter, 
is passed to function not by value.
It is not correct for 'value type': UInt16.
""");

    return 0;
}


