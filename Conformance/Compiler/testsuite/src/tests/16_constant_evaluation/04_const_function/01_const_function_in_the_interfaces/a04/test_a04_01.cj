
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_01_a04_01

  @Level:         1

  @Assertion:   16.4.1(4)
                interface I {
                    const func f(): Int64
                    const static func f2(): Int64
                }

                const func g<T>(i: T) where T <: I {
                    return i.f() + T.f2()
                }
  @Description: Check the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

interface I {
    const func f(): Int64
    const static func f2(): Int64
}

const func g<T>(i: T) where T <: I {
    return i.f() + T.f2()
}

class C <: I {
    public const func f()  { 1 }

    public const static func f2() { 2 }

    const init() { }
}

main() {
    Assert.equals(3, g(C()))
}
