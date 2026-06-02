/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a05_019

  @Level:         1

  @Assertion:    2(5) The value types include numeric types (include integer types and 
                 floating-point types, see Numeric Types), Rune type, Bool type, 
                 Unit type, Nothing type, String type, Tuple type, Range type, 
                 Function type, struct type, enum type and VArray type. 

  @Description:  Checks that: 
                 - variable, initialized with the value of another source variable of type 'Range',
                   has the same type 'Range';
                 - variable, initialized with the value of another source variable of type 'Range',
                   has the same value as source variable;
                 - variable of type 'Range' after reassigning has new corrrect value;
                 - type 'Range' actualy is 'value type';

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main() {
    var sourceVar: Range<Int64> = 0..20:2;
    var targetVar = sourceVar;

//Test_case_1
    let isExpectedType: Bool = targetVar is Range<Int64>;
    Assert.equals(true, isExpectedType, 
        reason:"""
Test_case_1: A variable, initialized with the value of another source variable of type 'Range', 
has unexpected type.
""");

//Test_case_2
    let is_expected_value_2: Bool = sourceVar == targetVar;
    Assert.equals(true, is_expected_value_2, 
        reason:"""
Test_case_2: A variable, initialized with the value of another source variable of type 'Range', 
has unexpected value.
""");

//Test_case_3
    sourceVar = 0..=20:2;
    let is_expected_value_3: Bool = (0..=20:2) == sourceVar;
    Assert.equals(true, is_expected_value_3, 
        reason:"Test_case_3: A variable of type 'Range' has unexpected value after reassigning.");

//Test_case_4
    let is_expected_value_4: Bool = (0..20:2) == targetVar;
    Assert.equals(true, is_expected_value_4, 
        reason:"""
Test_case_4: A variable, initialized with the value 
of another source variable of type 'Range', 
has a value different from value of initializing 
after source variable has been reaasigned.
It should not happen for 'value type' Range.
""");

    return 0;
}

