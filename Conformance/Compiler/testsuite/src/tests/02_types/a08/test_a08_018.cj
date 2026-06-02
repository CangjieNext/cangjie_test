/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a08_018

  @Level:         1

  @Assertion:    2(8) Thus, when a variable is used in assignments and passed as a 
                 function parameter in a function call, its value is copied 
                 if it is of a value type and its reference is copied if it is of a reference type.

  @Description:  Checks that:
                 - variable of type 'Range', used in assignment, 
                   is assigned to another variable by value,
                   what is correct for 'value type': Range.
                 - variable of type 'Range', used as function parameter, 
                   is passed to function by value, what is correct for 'value type': Range.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

var func_param: Range<Int32> = 0..1:1;
var func_param_copy: Range<Int32> = 0..1:1;

func testFunc(param: Range<Int32>, to_do: Int8): Bool{
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
    var sourceVar: Range<Int32> = 0..10:2;
    var sourceVar_orig: Range<Int32> = 0..10:2;
    var targetVar: Range<Int32> = sourceVar;
    sourceVar = 0..20:2;
    let is_expected_value: Bool = sourceVar_orig ==  targetVar;
    Assert.equals(true, is_expected_value, 
        reason:"""
Test_case_1: A variable of type 'Range<Int32>', used in assignment, 
is assigned to another variable not by value.
It is not correct for 'value type': Range<Int32>.
""");

//Test_case_2
    func_param = 0..40:2;
    testFunc(func_param, 1);
    func_param = 0..30:2;
    Assert.equals(true, testFunc(func_param, 2), 
        reason:"""
Test_case_2: A variable of type 'Range<Int32>', used as function parameter, 
is passed to function not by value.
It is not correct for 'value type': Range<Int32>.
""");

    return 0;
}


