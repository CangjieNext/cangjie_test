/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_03_a02_02

  @Level:         1

  @Assertion:       4.4.3(2) pattern guard can be used in match expressions as well as in for-in expressions.

  @Description:     Check that a pattern guard can be used in the for-in expressions.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    var sum = 0
    for (i in [4, 9, 3, 3, 10, 6, 3, 7] where i % 2 == 0) {
        sum += i
    }
    Assert.equals(20, sum)
}
