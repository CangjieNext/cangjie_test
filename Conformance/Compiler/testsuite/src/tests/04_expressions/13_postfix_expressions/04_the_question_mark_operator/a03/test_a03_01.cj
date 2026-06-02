/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a03_01

  @Level:         1

  @Assertion: 4.13.4(3) Here () is a function call, when the last argument of the function call is a lambda,
              the tail closure syntax can be used, e.g., a?{b}.

  @Description: Check question mark operator with regular function call and with trailing lambda expression.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    func foo(arg: Int64) {
        return arg
    }

    func invoke(fn: (Int64) -> Int64) {
        fn(3)
    }
}

main() {
    var c: ?C = C()

    // Case: regular function call.
    let f = c?.foo
    let y = f?(1240)
    Assert.equals(1240, y.getOrThrow())

    // Case: trailing lambda expression.
    let g = c?.invoke
    let x = g?{ i => i * i }
    Assert.equals(9, x.getOrThrow())
}

