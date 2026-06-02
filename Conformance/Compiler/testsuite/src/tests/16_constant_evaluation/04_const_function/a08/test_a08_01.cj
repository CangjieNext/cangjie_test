
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a08_01

  @Level:         1

  @Assertion:   16.4(8) 5.There are no special rules for parameter types and return types in const functions. If the
                real parameter of the function call does not meet the const expression requirement, then the function
                call cannot be used as a const expression, but it can still be used as a normal expression.
  @Description: Checks that parameter types in const functions can be non-const.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

class C { }

const func f(x: C) { 2 }

struct S {
    let v: Int64

    static const func sf(x: C) { 3 }

    const func mf(x: C) { 4 }

    const init(x: C) { v = 5 }
}

main() {
    const l = {x: C => 1}
    let c = C()
    Assert.equals(1, l(c))
    Assert.equals(2, f(c))
    Assert.equals(3, S.sf(c))
    Assert.equals(4, S(c).mf(c))
    Assert.equals(5, S(c).v)
}
