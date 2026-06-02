/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_05

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check for some previously not checked types T and expressions e of type T that the unwrapped value of
                (e as T) is equal to e.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

class C {
    var i : Int64 = 0
    init() {}
    init(x : Int64) { i = x }
}

func f1(a : Int64, b : Int64) { a + b}

main() {
    let c1 = C()
    let c = (c1 as C).getOrThrow()
    Assert.equals(c1.i, c.i)

    let t1 = (1, 2)
    let t = (t1 as (Int64, Int64)).getOrThrow()
    Assert.equals(t1[0], t[0])
    Assert.equals(t1[1], t[1])

    let f = (f1 as (Int64, Int64) -> Int64).getOrThrow()
    Assert.equals(f1(1, 2), f(1, 2))
    
    0
}
