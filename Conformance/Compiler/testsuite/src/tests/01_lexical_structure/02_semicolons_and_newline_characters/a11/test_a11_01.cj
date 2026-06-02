/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a11_01

  @Level:         1

  @Assertion:    1.2(11) In constant pattern, a newline character cannot be used as a separator between $
                         and the identifier following it.

  @Description:  Check the constant pattern with the line string literal where $ can be used.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

main() {
// test case #1
    let v1 : Int32 = 0
    let p1 = "${v1}"
    Assert.equals("0", p1)

// test case #2
    let v2 : String = ""
    let p2 = "${v2}"
    Assert.equals("", p2)

// test case #3
    let v3 : String = "\n"
    let p3 = "${v3}"
    Assert.equals("\n", p3)

// test case #4
    let v4  : Int32  = 0
    let v4_ : String = "\"${v4} 0x16\""
    let p4 = "${v4} ; ${v4_} ; let var = \$v4 + 1"
    Assert.equals("0 ; \"0 0x16\" ; let var = $v4 + 1", p4)
}
