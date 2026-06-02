/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a14_01

  @Level:         1

  @Assertion:   2.1.1(14) UInt64 0 ~ 2^64 − 1 (0 to 18446744073709551615)

  @Description: Checks that variable declared with integer type UInt64 can be assigned 
                by minimal and maximal values;

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/

import utils.assert.Assert

main() {
    //Test case 1
    let intVar01: UInt64 = 0;
    Assert.equals(0, intVar01, 
        reason: """
Test case 1: A variable, declared with type UInt64
and assigned by minimal UInt64 value, has unexpected value.
""");

    //Test case 2
    let intVar02: UInt64 = 18446744073709551615;
    Assert.equals(18446744073709551615, intVar02, 
        reason: """
Test case 2: A variable, declared with type UInt64
and assigned by maximal UInt64 value, has unexpected value.
""");

    return 0;
}

