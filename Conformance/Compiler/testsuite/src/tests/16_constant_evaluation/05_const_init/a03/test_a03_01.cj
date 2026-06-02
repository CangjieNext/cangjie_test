
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a03_01

  @Level:         1

  @Assertion:   16.5(3) 3.If an instance member variable of the current type has an initial value, the initial value
                must be a const expression, otherwise const init is not allowed to be defined.
  @Description: Check that const init is allowed if all default initialized instance member variables are initialized
                with a const expression.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func constExpr(x: Int64) { x }

struct S {
    var v = constExpr(0)
    let l = constExpr(1)
    static const c = constExpr(2)

    const init() { }
}

class C {
    let l = constExpr(3)
    static const c = constExpr(4)

    const init() { }
}

main() {
    const s = S()
    Assert.equals(0, s.v)
    Assert.equals(1, s.l)
    Assert.equals(2, S.c)
    const c = C()
    Assert.equals(3, c.l)
    Assert.equals(4, C.c)
}
