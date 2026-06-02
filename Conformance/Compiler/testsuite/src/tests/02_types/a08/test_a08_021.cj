/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a08_021

  @Level:         1

  @Assertion:    2(8) Thus, when a variable is used in assignments and passed as a 
                 function parameter in a function call, its value is copied 
                 if it is of a value type and its reference is copied if it is of a reference type.

  @Description:  Checks that:
                 - variable of type 'enum', used in assignment, 
                   is assigned to another variable by value,
                   what is correct for 'value type': enum.
                 - variable of type 'enum', used as function parameter, 
                   is passed to function by value, what is correct for 'value type': enum.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

enum TestEnum {
    value_0 | 
    value_1 | 
    value_2
}

func test_enum_to_string(param: TestEnum): String {
    let result: String = 
        match (param) {
            case value_0 => "value_0";
            case value_1 => "value_1";
            case value_2 => "value_2";
        };

    return result;
}

var func_param: TestEnum = TestEnum.value_0;
var func_param_copy: TestEnum = TestEnum.value_0;

func testFunc(param: TestEnum, to_do: Int8): Bool{
    if (to_do == 1){
        func_param_copy = param;
        return true;
    }

    if (to_do == 2){
        if (test_enum_to_string(func_param_copy) == test_enum_to_string(param)){
            return false;
        }
    }

    return true;
}

main() {
//Test_case_1
    var sourceVar: TestEnum = TestEnum.value_1;
    var targetVar: TestEnum = sourceVar;
    sourceVar = TestEnum.value_2;
    Assert.equals("value_1", test_enum_to_string(targetVar), 
        reason:"""
Test_case_1: A variable of type 'enum', used in assignment, 
is assigned to another variable not by value.
It is not correct for 'value type': enum.
""");

//Test_case_2
    func_param = TestEnum.value_1;
    testFunc(func_param, 1);
    func_param = TestEnum.value_2;
    Assert.equals(true, testFunc(func_param, 2), 
        reason:"""
Test_case_2: A variable of type 'enum', used as function parameter, 
is passed to function not by value.
It is not correct for 'value type': enum.
""");

    return 0;
}

