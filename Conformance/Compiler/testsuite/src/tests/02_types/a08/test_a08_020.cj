/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a08_020

  @Level:         1

  @Assertion:    2(8) Thus, when a variable is used in assignments and passed as a 
                 function parameter in a function call, its value is copied 
                 if it is of a value type and its reference is copied if it is of a reference type.

  @Description:  Checks that:
                 - variable of type 'struct', used in assignment, 
                   is assigned to another variable by value,
                   what is correct for 'value type': struct.
                 - variable of type 'struct', used as function parameter, 
                   is passed to function by value, what is correct for 'value type': struct.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

struct TestStruct {
    var field: Int32;
    init(field: Int32) {
        this.field = field
    };
}


var func_param: TestStruct = TestStruct(0);
var func_param_copy: TestStruct = TestStruct(0);

func testFunc(param: TestStruct, to_do: Int8): Bool{
    if (to_do == 1){
        func_param_copy = param;
        return true;
    }

    if (to_do == 2){
        if (func_param_copy.field == param.field){
            return false;
        }
    }

    return true;
}

main() {
//Test_case_1
    var sourceVar: TestStruct = TestStruct(1);
    var targetVar: TestStruct = sourceVar;
    sourceVar = TestStruct(2);
    Assert.equals(1, targetVar.field, 
        reason:"""
Test_case_1: A variable of type 'struct', used in assignment, 
is assigned to another variable not by value.
It is not correct for 'value type': struct.
""");

//Test_case_2
    func_param = TestStruct(3);
    testFunc(func_param, 1);
    func_param = TestStruct(4);
    Assert.equals(true, testFunc(func_param, 2), 
        reason:"""
Test_case_2: A variable of type 'struct', used as function parameter, 
is passed to function not by value.
It is not correct for 'value type': struct.
""");

    return 0;
}
