/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a08_023

  @Level:         1

  @Assertion:    2(8) Thus, when a variable is used in assignments and passed as a 
                 function parameter in a function call, its value is copied 
                 if it is of a value type and its reference is copied if it is of a reference type.

  @Description:  Checks that:
                 - variable of type 'class', used in assignment, 
                   is assigned to another variable by reference,
                   what is correct for 'reference type': class.
                 - variable of type 'class', used as function parameter, 
                   is passed to function by reference, what is correct for 'reference type': class.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

class TestClass {
    var testClassVar_01: Int32;
    var testClassVar_02: UInt32;
    public TestClass(var_01: Int32, var_02: UInt32)
    {
        this.testClassVar_01 = var_01;
        this.testClassVar_02 = var_02;
    }
};

var func_param: TestClass = TestClass(0, 0);

var func_param_copy: TestClass = TestClass(0, 0);
var func_param_1_copy: Int32 = 0;
var func_param_2_copy: UInt32 = 0;

func testFunc(param: TestClass, to_do: Int8): Bool{
    if (to_do == 1){
        func_param_copy = param;
        func_param_1_copy = param.testClassVar_01;
        func_param_2_copy = param.testClassVar_02;
    }

    if (to_do == 2){
        if ((func_param_copy.testClassVar_01 != param.testClassVar_01) || (func_param_copy.testClassVar_02 != param.testClassVar_02)){
            return false;
        }

        if ((func_param_1_copy == param.testClassVar_01) || (func_param_2_copy == param.testClassVar_02)){
            return false;
        }
    }

    return true;
}

main() {
//Test_case_1
    var sourceVar: TestClass = TestClass(1,2);
    var targetVar = sourceVar;
    sourceVar.testClassVar_01 = 99;

    Assert.equals(99, targetVar.testClassVar_01, 
        reason:"""
Test_case_1: A variable of type 'class', used in assignment, 
is assigned to another variable not by reference.
It is not correct for 'reference type': class.
""");


//Test_case_2
    func_param = TestClass(3,4);
    testFunc(func_param, 1);
    func_param.testClassVar_01 = 5;
    func_param.testClassVar_02 = 6;
    Assert.equals(true, testFunc(func_param, 2), 
        reason:"""
Test_case_2: A variable of type 'class', used as function parameter, 
is passed to function not by reference.
It is not correct for 'reference type': class.
""");

    return 0;
}


