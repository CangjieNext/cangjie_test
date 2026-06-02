
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_22_a02_01

  @Level:         1

  @Assertion:   4.22(2) The precedence of |> and ~> is the same, and is between || and assignment operator =. |> and ~>
                are both left-associative see the last section for more details.
  @Description: Checks that the precedence of |> and ~> is the same, and is between || and assignment operator =. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert
import std.random.Random

func i(b : Bool) { 
    if (b) {
        return 1
    }
    return 0
}

func m(x : Int64) { x * 2 }

let MODULO = 101u64
let PRIMITIVE_ROOT = 2u64

func map(x : UInt64) { (x * PRIMITIVE_ROOT) % MODULO }

func map1(x : UInt64) {
    let y = !x
    var res : Int64
    if (y > UInt64(Int64.Max)) {
        res = Int64(y - (1u64 << 63)) + Int64.Min
    } else {
        res = Int64(y)
    }
    return res
}
func map2(x : Int64) { Float64(x) }

main() {

    Assert.isTrue((true || false |> i) is Int64)
    Assert.isFalse((true || false |> i) is Bool)
    Assert.isTrue(((true || false) |> i) is Int64)
    Assert.equals(true || false |> i, (true || false) |> i)
    
    var x = -1
    x = true |> i
    Assert.equals(1, x)
    x = -1
    x = (true |> i)
    Assert.equals(1, x)
    Assert.isTrue((x = true |> i) is Unit)
    Assert.isFalse((x = true |> i) is Int64)
    Assert.isTrue((x = (true |> i)) is Unit)

    var f = {x: Int64 => x + 1}
    f = m ~> m
    Assert.equals(40, f(10))
    f = {x: Int64 => x + 1}
    f = (m ~> m)
    Assert.equals(40, f(10))

    let rnd = Random(123)
    for (_ in 0..1024) {
        let v = rnd.nextUInt64(MODULO - 1) + 1
        let w = rnd.nextUInt64()
        Assert.equals(v |> map |> map, v |> (map ~> map))
        Assert.equals(w |> map1 |> map2, w |> (map1 ~> map2))
    }
}

