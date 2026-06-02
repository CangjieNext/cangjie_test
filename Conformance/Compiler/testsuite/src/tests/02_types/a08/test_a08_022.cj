/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a08_022

  @Level:         1

  @Assertion:    2(8) Thus, when a variable is used in assignments and passed as a 
                 function parameter in a function call, its value is copied 
                 if it is of a value type and its reference is copied if it is of a reference type.

  @Description:  Checks that:
                 - variable of type 'Array<Int32>', used in assignment, 
                   is assigned to another variable by reference,
                   what is correct for 'reference type': Array<Int32>.
                 - variable of type 'Array<Int32>', used as function parameter, 
                   is passed to function by reference, what is correct for 'reference type': Array<Int32>.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

var func_param: Array<Int32> = [0, 0];

var func_param_copy: Array<Int32> = [0, 0];
var func_param_0_copy: Int32 = 0;
var func_param_1_copy: Int32 = 0;

func testFunc(param: Array<Int32>, to_do: Int8): Bool{
    if (to_do == 1){
        func_param_copy = param;
        func_param_0_copy = param[0];
        func_param_1_copy = param[1];
    }

    if (to_do == 2){
        if ((func_param_copy[0] != param[0]) || (func_param_copy[1] != param[1])){
            return false;
        }

        if ((func_param_0_copy == param[0]) || (func_param_1_copy == param[1])){
            return false;
        }
    }

    return true;
}

main() {
//Test_case_1
    var sourceArray: Array<Int32> = [10, 11, 12, 13];
    var targetArray = sourceArray;
    sourceArray[2] = 99;

    Assert.equals(99, targetArray[2], 
        reason:"""
Test_case_1: A variable of type 'Array<Int32>', used in assignment, 
is assigned to another variable not by reference.
It is not correct for 'reference type': Array<Int32>.
""");


//Test_case_2
    func_param = [11, 22];
    testFunc(func_param, 1);
    func_param[0] = -11;
    func_param[1] = -22;
    Assert.equals(true, testFunc(func_param, 2), 
        reason:"""
Test_case_2: A variable of type 'Array<Int32>', used as function parameter, 
is passed to function not by reference.
It is not correct for 'reference type': Array<Int32>.
""");

    return 0;
}


