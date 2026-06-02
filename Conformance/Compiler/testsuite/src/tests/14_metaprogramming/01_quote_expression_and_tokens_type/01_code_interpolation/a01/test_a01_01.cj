/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a01_01

  @Level:         1

  @Assertion:   14.1.1(1) In the quote expression, use $ as the code interpolation operator. 

  @Description: Checking the execution of the $ operator
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*
import std.convert.*

main(): Unit {
    let t1: Tokens = quote("ac + dc")
    let t2: Tokens = quote($("ac" + "dc"))

    Assert.equals('"ac + dc"', t1.toString())
    Assert.equals('"acdc"', t2.toString())

    var x = 36.6
    let t3: Tokens = quote(x + 3.3)
    let t4: Tokens = quote($x + 3.3)
    let t5: Tokens = quote($(x + 3.3))

    Assert.equals("x + 3.3", t3.toString())
    Assert.equals(x.format('2.1') + " + 3.3", t4.toString())
    Assert.equals(39.9.format('2.1'), t5.toString())

    var t6 = quote($({i: Float64 => i**i}(5.0)))
    Assert.equals("3125.0", t6.toString())
}
