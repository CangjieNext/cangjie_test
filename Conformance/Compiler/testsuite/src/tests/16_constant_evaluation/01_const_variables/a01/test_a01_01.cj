
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a01_01

  @Level:         1

  @Assertion:   16.1(1) A const variable is a special variable that is evaluated at compile time and cannot be changed
                at runtime.
  @Description: Checks compilation and execution of a program that uses const variables.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func f() { 333 }

class C {
    static const d = (1, 2)
}

struct S {
    static const g = "1"
}

const b = S.g + "2"

const e = f() / f()

main() {
    const a: Int64 = 0
    const c = 1 + 2
    const h = C.d

    Assert.equals(0, a)
    Assert.equals("12", b)
    Assert.equals(3, c)
    Assert.equals(1, e)
    Assert.isTrue((1, 2) == h)
}
