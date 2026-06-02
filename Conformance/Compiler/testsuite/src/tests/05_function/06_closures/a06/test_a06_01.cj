/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a06_01

  @Level:         1

  @Assertion: 5.6(6) A function or lambda that only captures immutable local variables can be used as a first-class 
              citizen, that is, can be assigned to a variable, can be used as an argument or a return value, and can 
              be used as an expression. 

  @Description: Check that function or lambda that only captures immutable local variables can be used as first-class
                citizen.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func callMe(fn: (Int64) -> Int64) {
    return fn(2)
}

func foo1() {
    let x = 3

    func f(arg: Int64) {
        x * arg
    }

    // Assignment to a variable.
    let g = f
    let x1 = g(2)
    Assert.equals(6, x1)

    // Usage as an argument.
    let x2 = callMe(f)
    Assert.equals(6, x2)

    // Usage as an expression.
    f

    // Usage as a return value.
    return f
}

func foo2() {
    let x = 3

    var f = { arg: Int64 => x * arg }

    // Assignment to a variable.
    let g = f
    let x1 = g(2)
    Assert.equals(6, x1)

    // Usage as an argument.
    let x2 = callMe(f)
    Assert.equals(6, x2)

    // Usage as an expression.
    f

    // Usage as a return value.
    return f
}

main() {
    var f1 = foo1()
    Assert.equals(6, f1(2))

    var f2 = foo2()
    Assert.equals(6, f2(2))
}

