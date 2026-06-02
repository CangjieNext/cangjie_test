
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a04_01

  @Level:         1

  @Assertion:   16.5(4) 4.const init can use assignment expressions to assign values to instance member variables, but
                no other assignment expressions are allowed.
  @Description: Check that const init can use assignment expressions to assign values to instance member variables.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const g = 6

struct S {
    var v1: Int64
    let l1: Int64
    var v2: Int64
    let l2: Int64

    const init() {
        v1 = 1
        l1 = 2
        (v2, l2) = (3, 4)
        const l = 7
        v1 = g
        v2 = l
    }
}

class C {
    let l: Int64

    const init() {
        l = 5
    }
}

main() {
    const s = S()
    Assert.equals(6, s.v1)
    Assert.equals(2, s.l1)
    Assert.equals(7, s.v2)
    Assert.equals(4, s.l2)
    const c = C()
    Assert.equals(5, c.l)
}
