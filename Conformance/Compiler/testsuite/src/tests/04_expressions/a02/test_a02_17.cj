/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_17

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the
              value of an expression is called the evaluation of the expression.
  @Description: Checks that bitwise expressions have a type and a value.
                Tests bitwise left shift (<<), bitwise right shift (>>), 
                bitwise AND (&), bitwise XOR (^) and bitwise OR (|).
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

let x = 0b1101111_i8
let y = 0b0010010_i8
var z = 12

main() {
    Assert.isTrue((x << 2) is Int8)
    Assert.equals(384, (12 << 5))
   
    Assert.isTrue((z >> 4) is Int64)
    Assert.equals(1, (z >> 3))

    Assert.isTrue((x & y) is Int8)
    Assert.equals(0b0000010, (x & y))

    Assert.isTrue((x ^ y) is Int8)
    Assert.equals(0b1111101_i8, (x ^ y))

    Assert.isTrue((x | y) is Int8)
    Assert.equals(0b1111111_i8, (0b1111111_i8 | 0b0000010_i8))
}
