
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a15_01

  @Level:         1

  @Assertion:   16.4(15)
                const func f(a: Int64): Int64 { // ok
                    let b = 6
                    if (a > 5 && (b + a) < 15) {
                        return a * a
                    }
                    return a
                }

                class A {
                    var a = 0
                }

                const func f1(a: A): Unit { // ok
                    return
                }

                const func f2(): A {
                    return A() // error, A did not contains const init
                }
  @Description: Checks the positive cases of the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614
*/

import utils.assert.Assert

const func f(a: Int64): Int64 { // ok
    let b = 6
    if (a > 5 && (b + a) < 15) {
        return a * a
    }
    return a
}

class A {
    var a = 0
}

const func f1(a: A): Unit { // ok
    return
}

main() {
    const c1 = f(-6)
    Assert.equals(-6, c1)
    const c2 = f(6)
    Assert.equals(36, c2)
    const c3 = f(66)
    Assert.equals(66, c3)
    Assert.isTrue(f1(A()) is Unit)
}
