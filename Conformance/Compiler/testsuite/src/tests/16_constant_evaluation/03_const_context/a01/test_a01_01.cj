
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_03_a01_01

  @Level:         1

  @Assertion:   16.3(1) const contexts are a class of specific contexts within which expressions must be const
                expressions, and which are always evaluated at compile time.
  @Description: Checks that const expressions in different const contexts are evaluated at compile time.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614
  @Comment:     Since there is no reliable way to check whether an expression is evaluated at compile time, this test
                compares computation time of identical expressions in const and non-const contexts. However, under some
                circumstances, which depend on the compiler, this test might not work as intended and thus not pass.

*/

import utils.assert.Assert
import std.time.DateTime

const func f() { 1 }

struct S {
    static const c1 = 1 + f()
    static const c2 = 1 + g()
    static const c3 = 1 + 1 + g()
    var v: Int64
    let l: Int64

    static const func g() { 1 + c1 }

    const init(x: Int64) {
        v = 1 + x
        l = 1 + c3
    }
}

const c = 0

main() {
    const n = 10 ** 6
    let t1 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    for (_ in 0..n) {
        const s = S(1)
    }
    let t2 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    for (_ in 0..n) {
        let s = S(1)
    }
    let t3 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    let ratio = Float64(t3 - t2) / Float64(t2 - t1)
    let m = 7.0
    Assert.isTrue(ratio < m)
}
