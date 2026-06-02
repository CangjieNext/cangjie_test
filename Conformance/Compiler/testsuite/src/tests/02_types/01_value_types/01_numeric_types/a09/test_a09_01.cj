/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a09_01

  @Level:         1

  @Assertion:   2.1.1(9) Int64 −2^63 ~ 2^63 − 1 (-9223372036854775808 to
                9223372036854775807)

  @Description: Checks that variable declared with integer type Int64 can be assigned 
                by minimal and maximal values;

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/

import utils.assert.Assert

main() {
    //Test case 1
    let intVar01: Int64 = -9223372036854775808;
    Assert.equals(-9223372036854775808, intVar01, 
        reason: """
Test case 1: A variable, declared with type Int64
and assigned by minimal Int64 value, has unexpected value.
""");

    //Test case 2
    let intVar02: Int64 = 9223372036854775807;
    Assert.equals(9223372036854775807, intVar02, 
        reason: """
Test case 2: A variable, declared with type Int64
and assigned by maximal Int64 value, has unexpected value.
""");

    return 0;
}

