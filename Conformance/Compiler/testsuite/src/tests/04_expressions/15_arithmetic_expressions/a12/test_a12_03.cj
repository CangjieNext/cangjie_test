
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a12_03

  @Level:         1

  @Assertion:   4.15(12) ** is the power operator, e.g., the result of the x**y is the yth power of the base x.
  @Description: Checks for random floats 0<=x<=y, z>=0 that x**z <= y**z and x**(-z) <= y**(-z)
  @Mode: run
  @Negative: no
  @Replay
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert
import std.random.Random
import std.math.*
import std.time.DateTime
import std.convert.*

main() {
    var seed:UInt64 = UInt64(DateTime.now().toUnixTimeStamp().toMilliseconds())
    print("@@Param ${seed}@@\n")

    let rnd = Random(seed)
    for (_ in 0..1024) {
        var x = Float64(rnd.nextUInt64()) * rnd.nextFloat64()
        var y = Float64(rnd.nextUInt64()) * rnd.nextFloat64()
        if (x > y) {
            let t = x 
            x = y 
            y = t
        }
        let z = Float64(rnd.nextUInt64()) * rnd.nextFloat64()
        Assert.isTrue(x**z <= y**z)
        Assert.isTrue(x**(-z) >= y**(-z))
    }
}
