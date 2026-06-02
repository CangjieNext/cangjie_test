/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a08_019

  @Level:         1

  @Assertion:    2(8) Thus, when a variable is used in assignments and passed as a 
                 function parameter in a function call, its value is copied 
                 if it is of a value type and its reference is copied if it is of a reference type.

  @Description:  Checks that:
                 - variable of type 'Function', used in assignment, 
                   is assigned to another variable by value,
                   what is correct for 'value type': Function.
                 - variable of type 'Function', used as function parameter, 
                   is passed to function by value, what is correct for 'value type': Function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

type func_type = (Int16) -> Int16;

func test_func_1(function:func_type, int16_param: Int16): Int16 { return function(int16_param) };

func check_func_1(param: Int16): Int16{ return param; }
func check_func_2(param: Int16): Int16{ return param + 1; }

func dummy_func(param: Int16): Int16{ return 0; }
var func_param_copy:func_type = dummy_func;

func test_func_2(param:func_type, to_do: Int8): Bool{
    if (to_do == 1){
        func_param_copy = param;
        return true;
    }

    if (to_do == 2){
        //println(func_param_copy(1));
        //println(param(1));
        if (func_param_copy(1) == param(1)){
            return false;
        }
    }

    return true;
}

main() {
//Test_case_1
    var sourceVar:func_type = check_func_1;
    var targetVar:func_type = sourceVar;
    sourceVar = check_func_2;
    let is_expected_result: Bool = (test_func_1(sourceVar, 222) ==  test_func_1(targetVar, 222));
    Assert.equals(false, is_expected_result, 
        reason:"""
Test_case_1: A variable of type 'Function', used in assignment, 
is assigned to another variable not by value.
It is not correct for 'value type': Function.
""");


//Test_case_2
    var func_param_1:func_type = check_func_1;
    var func_param_2:func_type = check_func_2;
    test_func_2(func_param_1, 1);
    Assert.equals(true, test_func_2(func_param_2, 2), 
        reason:"""
Test_case_2: A variable of type 'Function', used as function parameter, 
is passed to function not by value.
It is not correct for 'value type': Function.
""");

    return 0;
}

