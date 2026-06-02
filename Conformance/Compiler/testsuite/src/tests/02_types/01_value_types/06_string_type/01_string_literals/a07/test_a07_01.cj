/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          02_01_06_01_a07_01

  @Level:         1

  @Assertion:     2.1.6.1(7) Different from single-line string literals, a multi-line string literal
                  must span multiple lines.

  @Description:   Check that single-line string with new-line special character '\n' will be multy-line string.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

let mySingleLine: String = "A\nB\nC"
let myMultyLine: String = """
A
B
C"""

main() {
  Assert.equals(myMultyLine, mySingleLine)
}