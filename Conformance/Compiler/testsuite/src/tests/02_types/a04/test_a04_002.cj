/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a04_002

  @Level:         1

  @Assertion:    2(4) There are two categories of types at the top: value types 
                 and reference types.

  @Description:  Checks that there is 'reference type' using the 'class' type as an example.

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

main() {
    var sourceVar: TestClass = TestClass(100, 200);
    var targetVar = sourceVar;


//Test_case_1
    sourceVar.testClassVar_01 = 101;
    Assert.equals(101, sourceVar.testClassVar_01, 
        reason:"""
Test_case_1: A instance member of sourceVar object (TestClass) 
of type 'Int32' has unexpected value after reassigning.
""");

//Test_case_2
    sourceVar.testClassVar_02 = 201;
    Assert.equals(201, sourceVar.testClassVar_02, 
        reason:"""
Test_case_2: A instance member of sourceVar object (TestClass) 
of type 'UInt32' has unexpected value after reassigning.
""");

//Test_case_3
    Assert.equals(sourceVar.testClassVar_01, targetVar.testClassVar_01, 
        reason:"""
Test_case_3: A instance member of targetVar object (TestClass) 
of type 'Int32', has a value, different from the same instance 
member of sourceVar object (TestClass),
after that instance member has been reaasigned, using sourceVar object.
It should not happen for 'reference type' class.
""");

//Test_case_4
    Assert.equals(sourceVar.testClassVar_02, targetVar.testClassVar_02, 
        reason:"""
Test_case_4: A instance member of targetVar object (TestClass) 
of type 'UInt32', has a value, different from the same instance 
member of sourceVar object (TestClass),
after that instance member has been reaasigned, using sourceVar object.
It should not happen for 'reference type' class.
""");

    return 0;
}

