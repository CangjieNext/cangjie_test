/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a01_003

  @Level:         1

  @Assertion: 4(1): An expression can consist of one or more operands, acted on
              by zero or more operators.
  @Description: Checks that arithmetical, bitwise, relational, logical, 
                coalescing, flow and assignment expressions are valid
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var i: Int64 = Assert.getRuntimeZero()
var j: Int64 = 123
var k: Int64 = 0
let b: Bool    = Assert.getRuntimeZero() == 0

func f(x: Int32): Float32 { 
    Float32(x) 
}

func g(x: Float32): Int32 { 
    Int32(x) 
}

main(): Int64 {
    i + j / (k + 12)
    (i + j * k)
    (i + j) - k   
    i * (j + k)
    (i * k + 2) 
    7 - i + (j - 1) 

    i++
    j--

    i < 0
    j >= k
    i > 0 && j < k || i == k

    2 << i >> 1
    i | j
    j ^ k
    2 & 1

    !b
    b || true
    true && b
    (i > 0) || b && (j >- i)

    Option<Int64>.None ?? 0

    i |> { x: Int64 => x + 1 }
    f ~> g

    var x = 14
    x += 2
    x -= 8
    x *= 4
    x /= 2
    x %= 3

    0
}
