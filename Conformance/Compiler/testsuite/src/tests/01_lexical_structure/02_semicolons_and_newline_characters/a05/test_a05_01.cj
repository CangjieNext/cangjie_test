/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a05_01

  @Level:         1

  @Assertion:    1.2(5) Except the following scenarios where the use of a newline character
                        as a separator between two tokens is prohibited, string literals and multi-line comments,
                        in other scenarios, the principle of "maximal matching" (i.e., taking as many tokens
                        as possible to form a valid expression or declaration) will be used for determining
                        whether the newline character is processed as a separator of two tokens or
                        as the terminator of the expression or declaration.

  @Description:  Using the newline character as a separator of two tokens for different cases of expressions.

  @Mode:         run

  @Negative:     no

  @Issue:        0005973

  @Structure:    single

*/

import utils.assert.Assert

main() {
    // test case #1
    var v1 : Int32 = 9
    v1 =
    v1 +
    1 <<
    2
    Assert.equals(40, v1)
    
    // test case #2
    var v2 : Int32 = 9
    v2 =
    v2 - 
    1 <<
    2
    Assert.equals(32, v2)
   
}
