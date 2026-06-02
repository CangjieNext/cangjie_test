/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a10_01

  @Level:         1

  @Assertion: 4.13.4(10) Using the expressions a?.b, c?(d) and e?[f] as examples.

              2. The expressions a?.b, c?(d) and e?[f] are of type Option<U1>, Option<U2> and Option<U3> respectively.
                 In above, U1 is the type of the instance member b in T1, U2 is the type of the return value of the
                 function type (T2)->U2 and U3 is the type of the return value of execution the subscript operation on
                 T3.

  @Description: Check types of 'a?.b', 'c?(d)' and 'e?[f]' expressions.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct S {
    var xi: Int64 = 0
    var xf: Float64 = 0.0
    var xs: String = "hello"
}

func id<T>(t: T) {
    return t
} 

main() {
    // Case: type of 'a?.b'
    var s: ?S = S()
    Assert.isTrue(s?.xi is Option<Int64>)
    Assert.isTrue(s?.xf is Option<Float64>)
    Assert.isTrue(s?.xs is Option<String>)

    // Case: type of 'c?(d)'
    var fi: ?((Int64) -> Int64) = id<Int64>
    var ff: ?((Float64) -> Float64) = id<Float64>
    var fs: ?((String) -> String) = id<String>
    Assert.isTrue(fi?(300) is Option<Int64>)
    Assert.isTrue(ff?(3.0) is Option<Float64>)
    Assert.isTrue(fs?("h") is Option<String>)

    // Case: type of 'e?[f]'
    var ai: ?Array<Int64> = [1, 2, 3, 4, 5]
    var af: ?Array<Float64> = [1.0, 2.0, 3.0, 4.0, 5.0]
    var aw: ?Array<String> = ["a", "b", "c", "d", "e"]
    Assert.isTrue(ai?[1] is Option<Int64>)
    Assert.isTrue(af?[1] is Option<Float64>)
    Assert.isTrue(aw?[1] is Option<String>)
}

