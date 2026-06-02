/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            01_02_a12_04

  @Level:         1

  @Assertion:       1.2(12) Note: The above scenarios only prohibit the use of a newline character as a separator 
                    between two tokens, it does not mean that newline characters cannot be used in these scenarios 
                    (if a newline character is used, it is directly treated as the end of an expression or 
                    declaration).

  @Description:     Check that when newline characters is not allowed bw  tokens - it can be used as terminator 
                    for string literal where $ can be used.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

main() {
    var myVar00 : Int32 = 0
    let myVar01 = "${myVar00}"
    Assert.equals("0", myVar01)

    let myVar10 : String = ""
    var myVar11 = "${myVar10}"
    Assert.equals("", myVar11)

    var myVar20 : String = "\n"
    var myVar21 = "${myVar20}"
    Assert.equals("\n", myVar21)
}
