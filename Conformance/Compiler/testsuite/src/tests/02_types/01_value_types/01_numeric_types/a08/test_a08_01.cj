/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_01_a08_01

  @Level:         1

  @Assertion:   2.1.1(8) Int32 −2^31 ~ 2^31 − 1 (-2147483648 to 2147483647)

  @Description: Checks that variable declared with integer type Int32 can be assigned 
                by minimal and maximal values;

  @Mode:        run

  @Negative:    no

  @Structure:   single

*/

import utils.assert.Assert

main() {
    //Test case 1
    let intVar01: Int32 = -2147483648;
    Assert.equals(-2147483648, intVar01, 
        reason: """
Test case 1: A variable, declared with type Int32
and assigned by minimal Int32 value, has unexpected value.
""");

    //Test case 2
    let intVar02: Int32 = 2147483647;
    Assert.equals(2147483647, intVar02, 
        reason: """
Test case 2: A variable, declared with type Int32
and assigned by maximal Int32 value, has unexpected value.
""");

    return 0;
}

