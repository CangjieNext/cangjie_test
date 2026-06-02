/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_02_a13_05

  @Level:         1

  @Assertion:    1.2(13) For String literals and multi-line comments,
                         the principle of "maximal matching" is also not applicable.

  @Description:  String literal with some of multi-line comments nested.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert
main() {
    let s = "111 /* foo1 */ /* foo2 */"
    Assert.equals("111 /* foo1 */ /* foo2 */", s)
}