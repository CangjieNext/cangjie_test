
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a04_01

  @Level:         1

  @Assertion:   16.4(4) 2.The global const function and the static const function can only access external variables
                declared by const, including const global variables and const static member variables, but no other
                external variables.
  @Description: Checks that the global const function and the static const function can access external variables
                declared by const.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a04.cj
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert
import p.*

const y = 3

struct S {
    static const z = 4

    static const func f() {
        x + y + AuxA04.x + z
    }
}

const func g() {
    x + y + AuxA04.x + S.z
}

main() {
    Assert.equals(10, S.f())
    Assert.equals(10, g())
}
