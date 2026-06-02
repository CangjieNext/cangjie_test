
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a07_01

  @Level:         1

  @Assertion:   16.4(7) 4.let and const can be used in const functions to declare new local variables. But var is not
                supported.
  @Description: Checks that let and const can be used in const functions to declare new local variables.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func f() {
    let x: Int64 = 1
    let y = 2
    const z = 3
    return x + y + z
}

struct S {
    let v: Int64

    static const func sf() {
        let x: Int64 = 1
        let y = 2
        const z = 3
        return x + y + z
    }

    const func mf() {
        let x: Int64  = 1
        let y = 2
        const z = 3
        return x + y + z
    }

    const init() {
        let x: Int64 = 1
        let y = 2
        const z = 3
        v = x + y + z
    }
}

main() {
    const l = { =>
        let x: Int64 = 1
        let y = 2
        const z = 3
        return x + y + z
    }
    Assert.equals(6, l())
    Assert.equals(6, f())
    Assert.equals(6, S.sf())
    const s = S()
    Assert.equals(6, s.v)
    Assert.equals(6, s.mf())
}
