/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a07_001

  @Level:         1

  @Assertion:    2(7) The difference between a value type and a reference type is that 
                 the content of a value-type variable is the value of the variable, 
                 whereas the content of a reference type variable is a reference which 
                 refers to a value.

  @Description:  Checks that: 
                 - variable, initialized with the value of another source variable of type 'String',
                   has the same value as source variable;
                 - source variable after reassigning has new corrrect value;
                 - variable, initialized with the value of another source variable of type 'String',
                   has value different from value of source variable when source variable
                   was reassigned, what is correct for 'value type';

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main() {
    var sourceVar: String = "String_1";
    var targetVar = sourceVar;

//Test_case_1
    Assert.equals(sourceVar, targetVar, 
        reason:"""
Test_case_2: A variable, initialized with the value of another source variable of type 'String', 
has unexpected value.
""");

//Test_case_2
    sourceVar = "String_2";
    Assert.equals("String_2", sourceVar, 
        reason:"Test_case_2: Source variable of type 'String' has unexpected value after reassigning.");

//Test_case_3
    Assert.notEquals("String_2", targetVar, 
        reason:"""
Test_case_3: A variable, initialized with the value 
of another source variable of type 'String', 
has a value the same as value of source variable 
after source variable has been reaasigned.
It is not correct for 'value type': String.
""");

    return 0;
}

