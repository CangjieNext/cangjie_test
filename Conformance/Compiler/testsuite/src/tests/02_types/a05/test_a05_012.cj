/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_a05_012

  @Level:         1

  @Assertion:    2(5) The value types include numeric types (include integer types and 
                 floating-point types, see Numeric Types), Rune type, Bool type, 
                 Unit type, Nothing type, String type, Tuple type, Range type, 
                 Function type, struct type, enum type and VArray type. 

  @Description:  Checks that: 
                 - variable, initialized with the value of another source variable of type 'Float32',
                   has the same type 'Float32';
                 - variable, initialized with the value of another source variable of type 'Float32',
                   has the same value as source variable;
                 - variable of type 'Float32' after reassigning has new corrrect value;
                 - numeric type 'Float32' actualy is 'value type';

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:  

*/

import utils.assert.*

main() {
    var sourceVar: Float32 = 2.5;
    var targetVar = sourceVar;

//Test_case_1
    let isExpectedType = targetVar is Float32;
    Assert.equals(true, isExpectedType, 
        reason:"""
Test_case_1: A variable, initialized with the value of another source variable of type 'Float32', 
has unexpected type.
""");

//Test_case_2
    Assert.equals(sourceVar, targetVar, 
        reason:"""
Test_case_2: A variable, initialized with the value of another source variable of type 'Float32', 
has unexpected value.
""");

//Test_case_3
    sourceVar = -2.5;
    Assert.equals(-2.5, sourceVar, 
        reason:"Test_case_3: A variable of type 'Float32' has unexpected value after reassigning.");

//Test_case_4
    Assert.equals(2.5, targetVar, 
        reason:"""
Test_case_4: A variable, initialized with the value 
of another source variable of type 'Float32', 
has a value different from value of initializing 
after source variable has been reaasigned.
It should not happen for 'value type' Float32.
""");

    return 0;
}

