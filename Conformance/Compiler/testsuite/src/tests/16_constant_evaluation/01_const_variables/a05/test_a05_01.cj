
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a05_01

  @Level:         1

  @Assertion:   16.1(5) const expressions are defined below.
                const a: Int64 = 0 // ok
                const b: Int64 // error, b is uninitialized
                const c = f() // error, f() is not const expression
                const d = 0 // ok, the type of d is Int64

                func f(): Unit {}
  @Description: Checks the positive cases of the given example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const a: Int64 = 0 // ok
const d = 0 // ok, the type of d is Int64

func f(): Unit {}

main() {
    Assert.isTrue(a is Int64)
    Assert.equals(0, a)
    Assert.isTrue(d is Int64)
    Assert.equals(0, d)
}
