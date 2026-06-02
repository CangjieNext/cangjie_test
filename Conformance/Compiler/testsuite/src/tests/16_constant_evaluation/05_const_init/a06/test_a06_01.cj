
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_05_a06_01

  @Level:         1

  @Assertion:   16.5(6)
                struct R1 {
                    var a: Int64
                    let b: Int64

                    const init() { // ok
                        a = 0
                        b = 0
                    }
                }

                struct R2 {
                    var a = 0
                    let b = 0

                    const init() {} // ok
                }

                func zero(): Int64 {
                    return 0
                }

                struct R3 {
                    let a = zero()

                    const init() {} // error Initialization of a is not const expression
                }

                class C1 {
                    var a = 0

                    const init() {} // error a can not be var binding
                }

                struct R4 {
                    var a = C1()

                    const init() {} // error Initialization of a is not const expression
                }

                open class C2 {
                    let a = 0
                    let b = R2()

                    const init() {} // ok
                }

                class C3 <: C2 {
                    let c = 0

                    const init() {} // ok
                }
  @Description: Check the positive cases of the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

struct R1 {
    var a: Int64
    let b: Int64

    const init() { // ok
        a = 0
        b = 0
    }
}

struct R2 {
    var a = 0
    let b = 0

    const init() {} // ok
}

func zero(): Int64 {
    return 0
}

open class C2 {
    let a = 0
    let b = R2()

    const init() {} // ok
}

class C3 <: C2 {
    let c = 0

    const init() {} // ok
}

main() {
    const r1 = R1()
    Assert.isTrue(r1 is R1)
    Assert.equals(0, r1.a)
    Assert.equals(0, r1.b)
    const r2 = R2()
    Assert.isTrue(r2 is R2)
    Assert.equals(0, r2.a)
    Assert.equals(0, r2.b)
    const c2 = C2()
    Assert.isTrue(c2 is C2)
    Assert.equals(0, c2.a)
    Assert.equals(0, c2.b.a)
    Assert.equals(0, c2.b.b)
    const c3 = C3()
    Assert.isTrue(c3 is C3)
    Assert.isTrue(c3 is C2)
    Assert.equals(0, c3.a)
    Assert.equals(0, c3.b.a)
    Assert.equals(0, c3.b.b)
    Assert.equals(0, c3.c)
}
