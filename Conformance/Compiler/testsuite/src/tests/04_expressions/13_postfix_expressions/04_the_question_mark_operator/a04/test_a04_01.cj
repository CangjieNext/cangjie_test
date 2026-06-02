/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_04_a04_01

  @Level:         1

  @Assertion: 4.13.4(4) An expression at least containing one of ?., ?(), ?{} or ?[] is called
              an optional chaining expression.

  @Description: Check optional chaining expression usage.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct S {
    func foo(arg: Int64) {
        arg
    }

    func invoke(fn: (Int64) -> Int64) {
        fn(3)
    }

    func foo2(): Option<() -> Int64> {
        return Some<() -> Int64>({ => 1812 })
    }

    func invoke2(fn: () -> Unit): Option<(() -> Unit) -> Int64> {
        return Some<(() -> Unit) -> Int64>({ x => 1921 })
    }

    var x: Int64 = 3
}

struct S2 {
    var s: ?S = S()
}

main() {
    var s: ?S = S()
    let a: ?Array<Int64> = [1, 2, 3, 4, 5]

    var s2: ?S2 = S2()
    let t2: ?(?(Int64, Int64), ?(Int64, Int64)) = ((1, 2), (3, 4))
    let t3: ?(?S, ?S) = (S(), S())

    //
    // Case: single '?' in chain.
    //

    // Kind: '?.'
    let x1 = s?.x
    Assert.equals(3, x1.getOrThrow())

    // Kind: '?()'
    let x2 = s?.foo
    let x3 = x2?(1709)
    Assert.equals(1709, x3.getOrThrow())

    // Kind: '?{}'
    let x4 = s?.invoke
    let x5 = x4?{ i => i * i }
    Assert.equals(9, x5.getOrThrow())

    // Kind: '?[]'
    let x6 = a?[3]
    Assert.equals(4, x6.getOrThrow())

    //
    // Case: two '?' in chain.
    //

    // Kind: '?.'
    let y1 = s2?.s?.x
    Assert.equals(3, y1.getOrThrow())

    // Kind: '?()'
    let y2 = s?.foo2
    let y3 = y2?()?()
    Assert.equals(1812, y3.getOrThrow())

    // Kind: '?{}'
    let y4 = s?.invoke2
    let y5 = y4?{}?{}
    Assert.equals(1921, y5.getOrThrow())

    // Kind: '?[]'
    let y6 = t2?[0]?[1]
    Assert.equals(2, y6.getOrThrow())

    // Mixed kinds.
    let y7 = t3?[0]?.x
    Assert.equals(3, y7.getOrThrow())
}

