/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a05_01

  @Level:         1

  @Assertion:       4.4.2(5) The binding pattern is always irrefutable pattern.

  @Description:     Check that the binding pattern can't be a refutable pattern. Let's prove the opposite: let it be
                    refutable, i.e., there is a situation in which it may not match the value it is intended to match.
                    That is, that it's not equal to the matched value. But for any use of a binding pattern on a bool
                    variable, it matches on this variable value. Contradiction.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    let v = true
    match(v) {
        case bindingPattern => Assert.equals(v, bindingPattern)
    }
    match(!v) {
        case bindingPattern => Assert.equals(!v, bindingPattern)
    }
}
