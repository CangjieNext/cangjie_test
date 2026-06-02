/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a02_001

  @Level:         1

  @Assertion:   2.1.1(2) The integer types can be further divided into signed and unsigned
                integer types.

  @Description: Checks that:
                - there is signed integer type (e.g. Int8 type), which can take 
                  positive, negative integer values and zero;
                - there is unsigned integer type (e.g. UInt64 type), which can take 
                  positive integer values and zero;

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/

import utils.assert.Assert

main() {
//Test_case_1
    let intVar_01: Int8 = 1;
    Assert.equals(1, intVar_01, 
        reason:"""
Test_case_1: A variable, declared with type Int8
and it has been assigned by positive integer value,
has unexpected value.
""");

//Test_case_2
    let intVar_02: Int8 = -1;
    Assert.equals(-1, intVar_02, 
        reason:"""
Test_case_2: A variable, declared with type Int8
and it has been assigned by negative integer value, 
has unexpected value.
""");

//Test_case_3
    let intVar_03: Int8 = 0;
    Assert.equals(0, intVar_03, 
        reason:"""
Test_case_3: A variable, declared with type Int8
and it has been assigned by zero, has unexpected value.
""");

//Test_case_4
    let uintVar_01: UInt64 = 1;
    Assert.equals(1, uintVar_01, 
        reason:"""
Test_case_4: A variable, declared with type Int64
and it has been assigned by positive integer value,
 has unexpected value.
""");

//Test_case_5
    let uintVar_02: UInt64 = 0;
    Assert.equals(0, uintVar_02, 
        reason:"""
Test_case_5: A variable, declared with type UInt64
and it has been assigned by zero has, unexpected value.
""");

    return 0
}