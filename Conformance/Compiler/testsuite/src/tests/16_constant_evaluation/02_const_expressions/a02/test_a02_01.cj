
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_02_a02_01

  @Level:         1

  @Assertion:   16.2(2) In other non-const contexts, const expressions are not guaranteed to evaluate at compile time.
  @Description: Check that a const expression in a non-const context does not evaluate at compile time.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614
  @Comment:     Since there is no reliable way to check whether an expression is evaluated at compile time, this test
                validates that computation time of const expressions in a non-const context is way too long for them to
                be evaluated at compile time. However, under some circumstances, which depend on the compiler, this
                test might not work as intended and thus not pass.

*/

import utils.assert.Assert
import std.time.DateTime

const func f(x : Float64) { x ** 1.6 }

const func g(x : Float64) { x ** 1.4 }

main() {
    let n = 10**7
    let t1 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    for (_ in 0..n) {
        var v = f(1.4) + g(1.6)
    }
    let t2 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    let m = 5
    Assert.isTrue(t2 - t1 > m * n)
    return 0
}
