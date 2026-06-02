
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a01_01

  @Level:         1

  @Assertion:   16.2(1) Certain specific forms of expressions, called const expressions, have the ability to be
                evaluated at compile time. In const contexts, these are the only allowed expressions and are always
                evaluated at compile time.
  @Description: Checks compilation and execution of a program that uses const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

class C {
    static const x = 1.0

    const init() { }
}

const func f() { "2" }

const a = "1" + f()

main() {
    const b = 0 + 1
    const c = C.x + 1.0
    Assert.equals("12", a)
    Assert.equals(1, b)
    Assert.equals(2.0, c)
    return 0
}
