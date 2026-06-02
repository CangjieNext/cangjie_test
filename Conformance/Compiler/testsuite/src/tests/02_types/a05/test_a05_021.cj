/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a05_021

  @Level:         1

  @Assertion:    2(5) The value types include numeric types (include integer types and 
                 floating-point types, see Numeric Types), Rune type, Bool type, 
                 Unit type, Nothing type, String type, Tuple type, Range type, 
                 Function type, struct type, enum type and VArray type. 

  @Description:  Checks that: 
                 - variable, initialized with the value of another source variable of type 'struct',
                   has the same type 'struct';
                 - variable, initialized with the value of another source variable of type 'struct',
                   has correct values of it members;
                 - source variable of type 'struct' after reassigning has new corrrect values of it members;
                 - type 'struct' actualy is 'value type';

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

struct TestStruct {
    var field_01: Int64;
    var field_02: Int16;
    init(field_01: Int64, field_02: Int16) {
        this.field_01 = field_01
        this.field_02 = field_02
    };
}

main() {
    var sourceVar: TestStruct = TestStruct(7,8);
    var targetVar = sourceVar;

//Test_case_1
    let isExpectedType: Bool = targetVar is TestStruct;
    Assert.equals(true, isExpectedType, 
        reason:"""
Test_case_1: A variable, initialized with the value of 
another source variable of type 'struct', 
has unexpected type.
""");

//Test_case_2
    let is_expected_value_1: Bool = sourceVar.field_01 == targetVar.field_01;
    Assert.equals(true, is_expected_value_1, 
        reason:"""
Test_case_2: A variable, initialized by the value of 
another source variable of type 'struct', 
has value of struct' member different from value 
of the same struct' member of source variable.
""");

//Test_case_3
    let is_expected_value_2: Bool = sourceVar.field_02 == targetVar.field_02;
    Assert.equals(true, is_expected_value_2, 
        reason:"""
Test_case_3: A variable, initialized by the value 
of another source variable of type 'struct', 
has value of struct' member different from value 
of the same struct' member of source variable.
""");

//Test_case_4
    sourceVar = TestStruct(1,2);
    Assert.equals(1, sourceVar.field_01, 
        reason:"""
Test_case_4: Source variable of type 'struct' 
has unexpected value of struct' member after reassigning.
""");

//Test_case_5
    Assert.equals(2, sourceVar.field_02, 
        reason:"""
Test_case_5: Source variable of type 'struct' 
has unexpected value of struct' member after reassigning.
""");

//Test_case_6
    Assert.equals(7, targetVar.field_01, 
        reason:"""
Test_case_6: A variable, initialized by the value 
of another source variable of type 'struct', 
has value of struct' member different from value 
of the same struct' member after initializing
after source variable has been reaasigned.
It should not happen for 'value type' struct.
""");

//Test_case_7
    Assert.equals(8, targetVar.field_02, 
        reason:"""
Test_case_7: A variable, initialized by the value 
of another source variable of type 'struct', 
has value of struct' member different from value 
of the same struct' member after initializing
after source variable has been reaasigned.
It should not happen for 'value type' struct.
""");

    return 0;
}

