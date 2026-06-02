
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a05_01

  @Level:         1

  @Assertion:   16.4(5) const init function and const instance member function can access external variables declared
                by const in addition to const functions can access not only external variables declared by const, but
                also instance member variables of the current type.
  @Description: Checks that const init and const instance member functions can access external const variables and
                instance member variables.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a05.cj
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert
import p.*

const y = 3

struct S {
    let a: Int64
    var b: Int64
    static const c = 4

    const func f() { x + AuxA05.x + y + a + b + c }

    const init() {
        a = x + AuxA05.x + y
        b = c + a
    }
}

main() {
    const s = S()
    Assert.equals(6, S().a)
    Assert.equals(10, S().b)
    Assert.equals(26, S().f())
}
