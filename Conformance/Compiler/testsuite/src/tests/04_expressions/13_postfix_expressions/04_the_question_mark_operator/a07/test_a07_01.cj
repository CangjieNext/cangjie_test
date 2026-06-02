/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a07_01

  @Level:         1

  @Assertion: 4.13.4(7) For optional chaining expressions, we have the following rules.
 
              2. The type of an optional chaining expression is Option<T> (i.e., no matter how many ? it contains, its
                 type only has one level of option), in which T is the type of the last expression (i.e., variable or
                 function name, function call expression, or subscript access expression) in the optional chaining.

  @Description: Check that type of optional chaining expression is Option<T>

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct Point {
    Point(var x!: Int64, var y!: Int64) {}
}

class FunctionsSet {
    operator func() () {
        return 5
    }

    operator func() (fn: () -> Unit) {
        return 9
    } 
}

struct S {
    var p: ?Point = Point(x: 3, y: 4)
    var f: ?FunctionsSet = FunctionsSet()
    var a: ?Array<Int64> = [1, 2, 3, 4, 5]

    var vp = Point(x: 3, y: 4)
    var vf = FunctionsSet()
    var va = [1, 2, 3, 4, 5]
}

main() {
    let s: ?S = S()

    Assert.isTrue(s?.p  is Option<Option<Point>>)
    Assert.isTrue(s?.vp is Option<Point>)
    Assert.isTrue(s?.p?.x is Option<Int64>)
    Assert.isTrue(s?.vp.x is Option<Int64>)

    Assert.isTrue(s?.f  is Option<Option<FunctionsSet>>)
    Assert.isTrue(s?.vf is Option<FunctionsSet>)
    Assert.isTrue(s?.f?() is Option<Int64>)
    Assert.isTrue(s?.vf() is Option<Int64>)
    Assert.isTrue(s?.f?{} is Option<Int64>)
    Assert.isTrue(s?.vf{} is Option<Int64>)

    Assert.isTrue(s?.a  is Option<Option<Array<Int64>>>)
    Assert.isTrue(s?.va is Option<Array<Int64>>)
    Assert.isTrue(s?.a?[1] is Option<Int64>)
    Assert.isTrue(s?.va[1] is Option<Int64>)
}

