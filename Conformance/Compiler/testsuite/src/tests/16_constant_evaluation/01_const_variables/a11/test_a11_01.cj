
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a11_01

  @Level:         1

  @Assertion:   16.1(11)
                const a = 0 // ok

                class C {
                    const b = 0 // ok
                    static const c = 0 //ok

                    var v: Int64
                    init () {
                        const d = 0 // ok
                        v = b + c + d
                    }
                }

                extend C {
                    const e = 0 // error, const cannot be defined in extend
                }
  @Description: Checks the positive cases in the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const a = 0 // ok

class C {
    static const b = 0 // ok
    static const c = 0 //ok

    var v: Int64
    init () {
        const d = 0 // ok
        Assert.equals(0, d)
        v = b + c + d
    }
}

// extend C {
//     const e = 0 // error, const cannot be defined in extend
// }

main() {
    Assert.equals(0, C.c)
    let c = C()
    Assert.equals(0, C.b)
    Assert.equals(0, c.v)
}
