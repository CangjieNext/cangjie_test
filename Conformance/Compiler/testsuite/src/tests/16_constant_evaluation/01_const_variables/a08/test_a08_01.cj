
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a08_01

  @Level:         1

  @Assertion:   16.1(8)
                const a = 0

                main(): Int64 {
                    let b: Int64 = a // ok
                    print(a) // ok
                    let c: VArray<Int64, $0> = [] // ok
                    return 0
                }

  @Description: Checks the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6077, 6614

*/

import utils.assert.Assert

const a = 0

main(): Int64 {
    let b: Int64 = a // ok
    print(a) // ok
    let c: VArray<Int64, $0> = [] // ok

    Assert.equals(0, a)
    Assert.isTrue(a is Int64)
    Assert.equals(0, b)
    Assert.isTrue(b is Int64)
    Assert.equals(0, c.size)
    Assert.isTrue(c is VArray<Int64, $0>)
    return 0
}
