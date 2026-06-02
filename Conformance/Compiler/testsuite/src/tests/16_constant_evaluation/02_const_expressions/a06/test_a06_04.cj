
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a06_04

  @Level:         1

  @Assertion:   16.2(6) 4.const functions, which contain function names declared using const, lambda's that match the
                requirements of const functions, and the function expressions returned by those functions.
  @Description: Check that const functions, lambda's that match the requirements of const functions and the function
                expressions are const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func f() { 
    const func f0() {
        1
    }
    f0()
 }

const func g() { 
    { => 
        const func g0() {
            5
        }
        g0()
    }
}
    
class C {
    static const func f() { 
        const func f0() {
            2
        }
        f0()
    }

    const func g() { 
        const func g0() {
            3
        }
        g0()
    }

    const init() { }
}

main() {
    const c1 = f
    const c2 = C.f
    const o = C()
    const c3 = o.g
    const c4 = { =>
        const a = 2
        const b = 2
        return a + b
    }
    const c5 = g()

    Assert.equals(1, c1())
    Assert.equals(2, c2())
    Assert.equals(3, c3())
    Assert.equals(4, c4())
    Assert.equals(5, c5())
}
