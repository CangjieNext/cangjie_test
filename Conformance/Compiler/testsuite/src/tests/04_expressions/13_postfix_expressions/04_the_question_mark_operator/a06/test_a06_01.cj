/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a06_01

  @Level:         1

  @Assertion: 4.13.4(6) For optional chaining expressions, we have the following rules.
  
              1. For the expression e, delete all ? in e and replace the type of the expression immediately before ?
                 (i.e., Option<T>) by T to give the expression e1. If the type of e1 is an option type, then you need
                 to add a ? after e when use ., (), {} or [] on it. Otherwise, you should not add ? after e when use
                 ., (), {} or [] on it.

  @Description: Check that it is ok to add ? after an optional chaining expression when use '.', '()', '{}' or '[]' if
                expression type is an Option<T>.

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

    // Case: '?' before '.' in optional chaining expression of option type.
    let r1 = s?.p?.x
    Assert.equals(3, r1.getOrThrow())

    // Case: '?' before '()' in optional chaining expression of option type.
    let r2 = s?.f?()
    Assert.equals(5, r2.getOrThrow())

    // Case: '?' before '{}' in optional chaining expression of option type.
    let r3 = s?.f?(){}
    Assert.equals(9, r3.getOrThrow())

    // Case: '?' before '[]' in optional chaining expression of option type.
    let r4 = s?.a?[1]
    Assert.equals(2, r4.getOrThrow())

    // Case: no '?' before '.' in optional chaining expression of non-option type.
    //       s?.vp has non-option type.
    let r5 = s?.vp.x
    Assert.equals(3, r5.getOrThrow())

    // Case: no '?' before '()' in optional chaining expression of non-option type.
    //       s?.vf has non-option type.
    let r6 = s?.vf()
    Assert.equals(5, r6.getOrThrow())

    // Case: no '?' before '{}' in optional chaining expression of non-option type.
    //       s?.vf has non-option type.
    let r7 = s?.vf{}
    Assert.equals(9, r7.getOrThrow())

    // Case: no '?' before '[]' in optional chaining expression of non-option type.
    //       s?.va has non-option type.
    let r8 = s?.va[1]
    Assert.equals(2, r8.getOrThrow())
}

