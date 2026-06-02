
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a02_01

  @Level:         1

  @Assertion:   16.4(2) The difference between const functions and normal functions is that they are partially
                restricted to affect compile-time evaluation. const functions can only have declarations, const
                expressions, and restricted partial assignment expressions in them.
  @Description: Checks that const functions can have declarations, const expressions and restricted partial
                assignment expressions.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func g() { 1 }

const func f() {
    const c = 1
    let l1 = c + 1
    g()
    let l2: Int64
    l2 = g() + l1
    let l3: Int64
    if (l2 > 0) {
        l3 = 1
    } else {
        l3 = 2
    }
    try {
        const cc = c
    } catch (_) {
        
    }
    return l2
}

main() {
    Assert.equals(3, f())
}
