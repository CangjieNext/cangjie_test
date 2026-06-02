/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a08_024

  @Level:         1

  @Assertion:    2(8) Thus, when a variable is used in assignments and passed as a 
                 function parameter in a function call, its value is copied 
                 if it is of a value type and its reference is copied if it is of a reference type.

  @Description:  Checks that:
                 - variable of type 'interface', used in assignment, 
                   is assigned to another variable by reference,
                   what is correct for 'reference type': interface.
                 - variable of type 'interface', used as function parameter, 
                   is passed to function by reference, what is correct for 'reference type': interface.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

interface TestInterface {
    func interfaceFunc(): Int32;
};

class TestClass <: TestInterface {
    public var testClassMember: Int32;
    public func interfaceFunc(): Int32 { return testClassMember };

    public TestClass(param: Int32)
    {
        this.testClassMember = param;
    }
};


var FUNC_PARAM: TestInterface = TestClass(0);
var FUNC_PARAM_COPY: TestInterface = TestClass(0);

func testFunc(param: TestInterface, to_do: Int8): Bool{
    if (to_do == 1){
        FUNC_PARAM_COPY = param;
        //println(FUNC_PARAM_COPY.interfaceFunc());
    }

    if (to_do == 2){
        //println(FUNC_PARAM_COPY.interfaceFunc());
        if (FUNC_PARAM_COPY.interfaceFunc() != param.interfaceFunc()){
            return false;
        }
    }

    return true;
}

main() {
//Test_case_1
    var testClassVar = TestClass(100);
    var sourceVar: TestInterface = testClassVar;
    var targetVar: TestInterface = sourceVar;
    testClassVar.testClassMember = 99;

    Assert.equals(99, targetVar.interfaceFunc(), 
        reason:"""
Test_case_1: A variable of type 'interface', used in assignment, 
is assigned to another variable not by reference.
It is not correct for 'reference type': interface.
""");

//Test_case_2
    var test_class_instance = TestClass(3);
    FUNC_PARAM = test_class_instance;
    testFunc(FUNC_PARAM, 1);
    test_class_instance.testClassMember = 5;
    Assert.equals(true, testFunc(FUNC_PARAM, 2), 
        reason:"""
Test_case_2: A variable of type 'interface', used as function parameter, 
is passed to function not by reference.
It is not correct for 'reference type': interface.
""");

    return 0;
}

