/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a08_014

  @Level:         1

  @Assertion:    2(8) Thus, when a variable is used in assignments and passed as a 
                 function parameter in a function call, its value is copied 
                 if it is of a value type and its reference is copied if it is of a reference type.

  @Description:  Checks that:
                 - variable of type 'Rune', used in assignment, 
                   is assigned to another variable by value,
                   what is correct for 'value type': Rune.
                 - variable of type 'Rune', used as function parameter, 
                   is passed to function by value, what is correct for 'value type': Rune.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

var func_param: Rune = r'0';
var func_param_copy: Rune = r'0';

func testFunc(param: Rune, to_do: Int8): Bool{
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
    var sourceVar: Rune = r'1';
    var targetVar: Rune = sourceVar;
    sourceVar = r'2';
    Assert.equals(r'1', targetVar, 
        reason:"""
Test_case_1: A variable of type 'Rune', used in assignment, 
is assigned to another variable not by value.
It is not correct for 'value type': Rune.
""");

//Test_case_2
    func_param = r'A';
    testFunc(func_param, 1);
    func_param = r'B';
    Assert.equals(true, testFunc(func_param, 2), 
        reason:"""
Test_case_2: A variable of type 'Rune', used as function parameter, 
is passed to function not by value.
It is not correct for 'value type': Rune.
""");

    return 0;
}


