/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a08_01

  @Level:         1

  @Assertion: 4.13.4(8) For optional chaining expressions, we have the following rules.

              3. Once the value of any expression with an option type in the optional chaining is None, the value of
                 the entire optional chaining expression is None. Only when all expressions with option types in the
                 optional chaining have Some values, the value of the entire expression is Some(v) (the type of v is
                 the type of the last expression).

  @Description: Check that value of optional chaining expression is evaluated to None if any optional sub expression 
                is None and evaluated to Some if all optional sub expressions are not None.

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

    var np = Option<Point>.None
    var nf = Option<FunctionsSet>.None
    var na = Option<Array<Int64>>.None
}

main() {
    let s: ?S = S()
    let n: ?S = Option<S>.None

    // Case: all option sub expressions are not None.
    Assert.isSome(s?.p)
    Assert.isSome(s?.p?.x)
    Assert.isSome(s?.vp)
    Assert.isSome(s?.vp.x)
    Assert.isSome(s?.f)
    Assert.isSome(s?.f?())
    Assert.isSome(s?.f?{})
    Assert.isSome(s?.vf)
    Assert.isSome(s?.vf())
    Assert.isSome(s?.vf{})
    Assert.isSome(s?.a)
    Assert.isSome(s?.a?[1])
    Assert.isSome(s?.va)
    Assert.isSome(s?.va[1])

    // Case: the first option sub expression in chain is None.
    Assert.isNone(n?.p)
    Assert.isNone(n?.p?.x)
    Assert.isNone(n?.vp)
    Assert.isNone(n?.vp.x)
    Assert.isNone(n?.f)
    Assert.isNone(n?.f?())
    Assert.isNone(n?.f?{})
    Assert.isNone(n?.vf)
    Assert.isNone(n?.vf())
    Assert.isNone(n?.vf{})
    Assert.isNone(n?.a)
    Assert.isNone(n?.a?[1])
    Assert.isNone(n?.va)
    Assert.isNone(n?.va[1])

    // Case: the second option sub expression in chain is None.
    Assert.isNone(s?.np?.x)
    Assert.isNone(s?.nf?())
    Assert.isNone(s?.nf?{})
    Assert.isNone(s?.na?[1])
}

