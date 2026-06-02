
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a07_01

  @Level:         1

  @Assertion:   16.1(7) Unlike let/var declared variables, const can significantly reducing the computation required at
                runtime, since the result is available at compile time.
  @Description: Checks that using const reduces the computation required at runtime.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert
import std.time.DateTime

func f1(x : Float64) { x * 0.9 }

func f2(x : Float64) { x ** 1.1 }

const func f3(x : Float64) { x ** 1.1 }

main() {
    let n = 10 ** 7
    var f = 0.0
    let t1 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    for (_ in 0..n) {
        let c = f2(0.9)
        f += c
    }
    let t2 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    for (_ in 0..n) {
        const c = f3(0.9)
        f += c
    }
    let t3 = DateTime.now().toUnixTimeStamp().toNanoseconds()
    let e = 0.001
    Assert.isTrue(Float64(t2 - t1) > Float64(t3 - t2))
}
