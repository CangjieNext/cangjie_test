
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a07_01

  @Level:         1

  @Assertion:   16.2(7) 5.const function calls (including const constructor), the expression of the function must be a
                const expression and all real parameters must be const expressions.
  @Description: Check that const functions, lambda's that match the requirements of const functions and the function
                expressions are const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func f(x: Int64) { x }

class C {
    static const func f(x: Int64) { x }

    const func g(x: Int64) { x + 1 }

    const init() { }
}

main() {
    const c1 = f(1)
    const c2 = C.f(2)
    const c3 = C()
    const c4 = c3.g(3)
    const c5 = { b: Int64 =>
        const a = 2
        return a + b
    }(3)

    Assert.equals(1, c1)
    Assert.equals(2, c2)
    Assert.equals(4, c4)
    Assert.equals(5, c5)
}
