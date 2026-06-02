/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_01

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the
              value of an expression is called the evaluation of the expression.
  @Description: Checks that literals are expressions which have type and value.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

let i: Int64   = 15
let f: Float64 = 3.14
let c: Rune    = r'c'
let b: Bool    = true

let str   : String        = "Hello"
let arrI8 : Array<UInt8>  = [72, 101, 108, 108, 111]
let arrStr: Array<String> = ["This", "is", "me"]

func getTuple(i: Int64, j: Int64) {
    (i, j)
}

main() {
    // Integer:
    Assert.isTrue(15 is Int64)
    Assert.equals(15, i)
    Assert.notEquals(i, 1)
  
    Assert.isTrue(0u8 is UInt8)
    Assert.equals(UInt8(i), 15u8)
    Assert.notEquals(UInt8(i), 2u8)

    Assert.isTrue(4i32 is Int32)
    Assert.equals(Int32(i), 15i32)
    Assert.notEquals(Int32(i), 33i32)

    // Float:
    Assert.isTrue(3.14 is Float64)
    Assert.equals(3.14, f)
    Assert.notEquals(f, 8.2567)

    Assert.isTrue(3.14_f32 is Float32)
    Assert.equals(Float32(f), 3.14_f32)
    Assert.notEquals(Float32(f), 3.00_f32)

    // Rune: 
    Assert.isTrue(r'c' is Rune)
    Assert.equals(r'c', c)
    Assert.notEquals(c, r'd')

    Assert.isTrue(r'c' is Rune)
    Assert.equals(UInt8(99), b'c')
    Assert.notEquals(UInt8(0), b'c')

    // Bool:
    Assert.isTrue(true is Bool)
    Assert.isTrue(false is Bool)
    Assert.equals(true, b)
    Assert.notEquals(b, false)
    Assert.isTrue(true)
    Assert.isFalse(false)

    // String:
    Assert.isTrue("Hello" is String)
    Assert.equals("Hello", str)
    Assert.notEquals(str, "Good bye")

    // Array:
    Assert.isTrue([0, 1, 2, 3, 4] is Array<Int64>)
    Assert.equals(arrStr, ["This", "is", "me"])
    Assert.notEquals(arrStr, ["1", "2"])

    // Tuple:
    Assert.isTrue((0, "tuple", true) is (Int64, String, Bool))
    if(getTuple(0, 1) == (1, 0)) { 
        Assert.fail(reason: "(1, 0) should not be equal to (0, 1).") 
    }
    if(getTuple(1, 0) != (1, 0)) { 
        Assert.fail(reason: "(1, 0) should be equal to itself.") 
    }
}
