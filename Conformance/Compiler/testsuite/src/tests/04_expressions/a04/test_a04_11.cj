/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_11

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that expression can be a part of the composite 
                expression. Tests operators: '=', '+=', '-=', '**=', '*=', 
                '/=', '%=', '&&=', '||=', '&=', '|=', '^=', '<<=', '>>='.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
*/

import utils.assert.Assert

let i1: Int32 = Int32(Assert.getRuntimeZero())
let i2: Int32 = 2
let i3: Int32 = 3
let i4: Int32 = 4
var i5: Int32 = Int32(Assert.getRuntimeZero() + 10)
var i6: Int32 = 20
var i7: Int32 = 30

let b1 = (Assert.getRuntimeZero() == 1)
let b2 = (Assert.getRuntimeZero() > 1)
let b3 = (Assert.getRuntimeZero() < 1)

main() {
    var x = i1 - (i2 / i3 + i4) * (i5 % i6) + i7
    Assert.isTrue(x is Int32)
    Assert.equals(-10, x)

    x += i1 - (i2 / i3 + i4) * (i5 % i6) + i7
    Assert.equals(-20, x)

    x -= i1 - (i2 / i3 + i4) * (i5 % i6) + i7
    Assert.equals(-10, x)

    x *= i1 - (i2 / i3 + i4) * (i5 % i6) + i7
    Assert.equals(100, x)

    x /= i1 - (i2 / i3 + i4) * (i5 % i6) + i7
    Assert.equals(-10, x)

    x %= i1 - (i2 / i3 + i4) * (i5 % i6) + i7
    Assert.equals(0, x)

    var f = Int64(i1 - (i2 / i3 + i4) * (i5 % i6) + i7) 
    Assert.isTrue(f is Int64)
    Assert.equals(-10, f)

    f **= UInt64(-(i1 - (i2 / i3 + i4) * (i5 % i6) + i7)) 
    Assert.equals(10000000000, f)

    var b = b1 && ((x > 1) || (i1 < 0)) && (b2 || b3 || (i1 == x)) && (8 < i5)
    Assert.isTrue(b is Bool)
    Assert.isFalse(b)

    b &&= b1 && ((x > 1) || (i1 < 0)) && (b2 || b3 || (i1 == x)) && (8 < i5)
    Assert.isFalse(b)

    b ||= b1 && ((x > 1) || (i1 < 0)) && (b2 || b3 || (i1 == x)) && (8 < i5)
    Assert.isFalse(b)

    x &= i1 - (i2 / i3 + i4) * i5 % (i6 + i7)
    Assert.equals(0, x)

    x |= i1 - (i2 / i3 + i4) * i5 % (i6 + i7)
    Assert.equals(-40, x)

    x ^= i1 - (i2 / i3 + i4) * i5 % (i6 + i7)
    Assert.equals(0, x)

    x = 123
    x <<= (i1 + (i2 / i3 + i4) * i5 % (i6 + i7)) / 10
    Assert.equals(1968, x)

    x >>= (i1 + (i2 / i3 + i4) * i5 % (i6 + i7)) / 5
    Assert.equals(7, x)
}

