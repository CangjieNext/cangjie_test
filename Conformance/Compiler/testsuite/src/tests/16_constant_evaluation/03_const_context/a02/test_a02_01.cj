
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_03_a02_01

  @Level:         1

  @Assertion:   16.3(2) Const context is the variable initialization expression.
  @Description: Checks variable initialization in different const contexts.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func f() { 1 }

struct S {
    static const c1 = 1 + f()
    static const c2 = 1 + g()
    static const c3 = 1 + 1 + g()
    var v: Int64
    let l: Int64

    static const func g() { 1 + c1 }
    const init(x: Int64) {
        v = 1 + x
        l = 1 + c3
    }
}

const c = 0

main() {
    const s = S(1)

    Assert.equals(0, c)
    Assert.equals(2, S.c1)
    Assert.equals(4, S.c2)
    Assert.equals(5, S.c3)
    Assert.equals(6, s.l)
    Assert.equals(2, s.v)
}
