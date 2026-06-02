/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a05_016

  @Level:         1

  @Assertion:    2(5) The value types include numeric types (include integer types and 
                 floating-point types, see Numeric Types), Rune type, Bool type, 
                 Unit type, Nothing type, String type, Tuple type, Range type, 
                 Function type, struct type, enum type and VArray type. 

  @Description:  Checks that: 
                 - variable, initialized with the value of another source variable,
                   declared with the type 'Unit', has the same type 'Unit';
                 - variable, initialized with the value of another source variable,
                   declared with the type 'Unit', has the same value as source variable;
                 - variable, initialized with the value of another source variable of type 'Unit',
                   declared without the type, has the type 'Unit';
                 - variable, initialized with the value of another source variable of type 'Unit',
                   declared without the type, has the same value as source variable;

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main() {
    var sourceVar_01: Unit = ();
    var targetVar_01 = sourceVar_01;

//Test_case_1
    let isExpectedType_01: Bool = targetVar_01 is Unit;
    Assert.equals(true, isExpectedType_01, 
        reason:"""
Test_case_1: A variable, initialized with the value of another source variable, 
declared with the type 'Unit', has unexpected type.
""");

//Test_case_2
    let is_expected_value_01: Bool = sourceVar_01 == targetVar_01;
    Assert.equals(true, is_expected_value_01, 
        reason:"""
Test_case_2: A variable, initialized with the value of another source variable, 
declared with the type 'Unit', has unexpected value.
""");


    var sourceVar_02 = ();
    var targetVar_02 = sourceVar_02;

//Test_case_3
    let isExpectedType_02: Bool = targetVar_02 is Unit;
    Assert.equals(true, isExpectedType_02, 
        reason:"""
Test_case_3: A variable, initialized with the value of another source variable 
of type "Unit', declared without the type, has unexpected type.
""");

//Test_case_4
    let is_expected_value_02: Bool = sourceVar_02 == targetVar_02;
    Assert.equals(true, is_expected_value_02, 
        reason:"""
Test_case_4: A variable, initialized with the value of another source variable 
of type "Unit', declared without the type, has unexpected value.
""");

    return 0;
}

