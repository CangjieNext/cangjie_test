/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a11_01

  @Level:         1

  @Assertion: 4.13.4(11) Using the expressions a?.b, c?(d) and e?[f] as examples.

              3. When the values of a, c and e are equal to Some(v1), Some(v2) and Some(v3) respectively, the values of
                 a?.b, c?(d) and e?[f] are equal to Option<U1>.Some(v1.b), Option<U2>.Some(v2(d)) and
                 Option<U3>.Some(v3[f]) respectively. When the values of a, c and e are equal to None respectively, the
                 values of a?.b, c?(d) and e?[f] are equal to Option<U1>.None, Option<U2>.None and Option<U3>.None
                 respectively (note that here b, d and f will not be evaluated).

  @Description: Check values of 'a?.b', 'c?(d)' and 'e?[f]'.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct S {
    var xi: Int64 = 1812
    var xf: Float64 = 10.0
    var xs: String = "hi"
}

func id<T>(t: T) {
    return t
}

main() {
    // Case: 'a?.b'
    var s: ?S = S()
    Assert.isTrue(s?.xi == 1812)
    Assert.isTrue(s?.xf == 10.0)
    Assert.isTrue(s?.xs == "hi")

    var n: ?S = Option<S>.None
    Assert.isNone(n?.xi)
    Assert.isNone(n?.xf)
    Assert.isNone(n?.xs)

    // Case: 'c?(d)'
    let fi: ?((Int64) -> Int64) = id<Int64>
    let ff: ?((Float64) -> Float64) = id<Float64>
    let fs: ?((String) -> String) = id<String>
    Assert.isTrue(fi?(1812) == 1812)
    Assert.isTrue(ff?(10.0) == 10.0)
    Assert.isTrue(fs?("hi") == "hi")

    let gi = Option<(Int64) -> Int64>.None
    let gf = Option<(Float64) -> Float64>.None
    let gs = Option<(String) -> String>.None
    Assert.isNone(gi?(1812))
    Assert.isNone(gf?(10.0))
    Assert.isNone(gs?("hi"))

    // Case: type of 'e?[f]'
    var ai: ?Array<Int64> = [1, 2, 3, 4, 5]
    var af: ?Array<Float64> = [1.0, 2.0, 3.0, 4.0, 5.0]
    var aw: ?Array<String> = ["a", "b", "c", "d", "e"]
    Assert.isTrue(ai?[1] == 2)
    Assert.isTrue(af?[1] == 2.0)
    Assert.isTrue(aw?[1] == "b")

    var bi = Option<Array<Int64>>.None
    var bf = Option<Array<Float64>>.None
    var bw = Option<Array<String>>.None
    Assert.isNone(bi?[1])
    Assert.isNone(bf?[1])
    Assert.isNone(bw?[1])
}

