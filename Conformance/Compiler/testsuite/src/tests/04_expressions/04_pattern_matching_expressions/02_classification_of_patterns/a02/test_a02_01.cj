/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a02_01

  @Level:         1

  @Assertion:       4.4.2(2) On the other hand, a pattern is said to be irrefutable when it can always match the value
                    it is intended to match.

  @Description:     Check that some pattern can be irrefutable. For example, the wildcard pattern.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    let v = true
    match(v) {
        case _ => Assert.isTrue(true)
    }
    match(!v) {
        case _ => Assert.isTrue(true) // No matter what is inside the match expression, wildcard can't be not equal to
                                      // its value.
    }
}
