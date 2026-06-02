
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_01

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that Expressions can be composed into composite 
                expressions. Tests numeric literals and variables, 
                parenthesized expressions, type conversion, relational 
                expressions, bitwise expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

let i1: Int64 = Assert.getRuntimeZero()
let i2: Int64 = 2
let i3: Int64 = 3
let i4: Int64 = 4
var i5: Int64 = Assert.getRuntimeZero() + 10
var i6: Int64 = 20
var i7: Int64 = 30

let ui1: UInt64 = UInt64(Assert.getRuntimeZero() + 1)
let ui2: UInt64 = UInt64(Assert.getRuntimeZero() + 2)
let ui3: UInt64 = UInt64(Assert.getRuntimeZero() + 3)
var ui4: UInt64 = UInt64(Assert.getRuntimeZero() + 4)
var ui5: UInt64 = UInt64(Assert.getRuntimeZero() + 5)

let f1: Float32 = 3.14
let f2: Float32 = 1.2345_f32
let f3: Float32 = 0.0_f32
let f4: Float32 = 1.2
var f5: Float32 = 3.45
var f6: Float32 = 67.890
var f7: Float32 = 10.0

let j1: Int8 = 0b1101111_i8
let j2: Int8 = 0b0010010_i8
var j3: Int8 = 12

main() {

    var x1 = 1 + 2 * 3 / 4 % 5 * 6 
    Assert.isTrue(x1 is Int64)
    Assert.equals(7, x1)

    var x2 = 1 + 2 * (3 / 4 - 5) % 6 * 7
    Assert.isTrue(x2 is Int64)
    Assert.equals(-27, x2)

    var x3 = i1 - i2 / i3 + i4 * (i5 % i6) + i7
    Assert.isTrue(x3 is Int64)
    Assert.equals(70, x3)

    var x4 = i1 - (i2 / i3 + i4) * (i5 % i6) + i7
    Assert.isTrue(x4 is Int64)
    Assert.equals(-10, x4)

    var x5 = 1 - i2 / 3 + i4 * 5 % i6 + 7
    Assert.isTrue(x5 is Int64)
    Assert.equals(8, x5)

    var x6 = i1 - (2 / i3 + 4) * (i5 % 6) + i7
    Assert.isTrue(x6 is Int64)
    Assert.equals(14, x6)

    var y1 = 3.14 + 1.28 * 3.123 / 4.1 * 6.0
    Assert.isTrue(y1 is Float64)
    Assert.approxEquals(8.989912, y1)

    var y2 = Float16(3.14 + 1.28 * (3.123 - 4.1 + 36.6))
    Assert.isTrue(y2 is Float16)
    Assert.equals(48.75, y2)

    var y3: Float32 = f1 - f2 / (f3 + 0.01) + f4 * (f5 - f6) + f7
    Assert.equals(-187.6380, y3)

    y3 = f1 - f2 / (f3 + f4) * (f5 - f6) + f7
    Assert.equals(79.432648, y3)

    y3 = f1 - 3.14 / (f3 + 0.0000001_f32) * (f5 - 1.0_f32) + f7
    Assert.equals(-76929992.0, y3)

    var x7 = (((i1 ** 2) ** 3) ** 4) ** 5
    Assert.isTrue(x7 is Int64)
    Assert.equals(0, x7)

    var z = (j1 >> Int8(1)) & j2 ^ (j3 | 0b1111101_i8) + 
            (Option<Int8>.None ?? 1)
    Assert.isTrue(z is Int8)
    Assert.equals(108_i8, z)

    try {
        x1++
        i7--
        x2 = ((((i2 ** ui1) ** ui2) ** ui3) ** ui4) ** ui5
        Assert.fail(reason: "Should not reach here")
    } catch(e: OverflowException) {
        if((ui1 == ui2) || 
                (ui1 != ui3 && ui4 <= ui5 && ui1 >= ui5) ||
                (ui1 < 5 && ui2 > 1)) {
            x2++
            i6 = -i7
        }
    }
    Assert.equals(-26, x2)
    Assert.equals(-29, i6)

    var f = Float64(Float32(Int64(Int32(Int16(Int8(1))))))
    Assert.equals(1.0, f)
    
    var i = Int64(Int32(Int16(Int8(Assert.getRuntimeZero() + Int64(3.14)))))
    Assert.isTrue(i is Int64)
    Assert.equals(3, i)
}
