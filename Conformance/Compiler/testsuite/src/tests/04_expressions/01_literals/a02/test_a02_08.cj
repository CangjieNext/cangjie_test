
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a02_08

  @Level:         1

  @Assertion:   4.1(2)
                A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks that array literals have proper type. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C {}

main() {
    Assert.isFalse(([0, 1]) is Bool)
    Assert.isFalse(([0, 1]) is Int8)
    Assert.isFalse(([0, 1]) is Int16)
    Assert.isFalse(([0, 1]) is Int32)
    Assert.isFalse(([0, 1]) is Int64)
    Assert.isFalse(([0, 1]) is UInt8)
    Assert.isFalse(([0, 1]) is UInt16)
    Assert.isFalse(([0, 1]) is UInt32)
    Assert.isFalse(([0, 1]) is UInt64)
    Assert.isFalse(([0, 1]) is Float16)
    Assert.isFalse(([0, 1]) is Float32)
    Assert.isFalse(([0, 1]) is Float64)
    Assert.isFalse(([0, 1]) is Rune)
    Assert.isFalse(([0, 1]) is String)
    Assert.isFalse(([0, 1]) is Array<Int8>)
    Assert.isFalse(([0, 1]) is Array<Int16>)
    Assert.isFalse(([0, 1]) is Array<Int32>)
    Assert.isTrue(([0, 1]) is Array<Int64>)
    Assert.isFalse(([0, 1]) is Array<UInt8>)
    Assert.isFalse(([0, 1]) is Array<UInt16>)
    Assert.isFalse(([0, 1]) is Array<UInt32>)
    Assert.isFalse(([0, 1]) is Array<UInt64>)
    Assert.isFalse(([0, 1]) is Array<Float16>)
    Assert.isFalse(([0, 1]) is Array<Float32>)
    Assert.isFalse(([0, 1]) is Array<Float64>)
    Assert.isFalse(([0, 1]) is (Int64, Int64))
    Assert.isFalse(([0, 1]) is (Float64, Float64))
    Assert.isFalse(([0, 1]) is Unit)
    Assert.isFalse(([0, 1]) is () -> Unit)
    Assert.isFalse(([0, 1]) is C)

    Assert.isFalse(([-3.14, 8e-3]) is Bool)
    Assert.isFalse(([-3.14, 8e-3]) is Int8)
    Assert.isFalse(([-3.14, 8e-3]) is Int16)
    Assert.isFalse(([-3.14, 8e-3]) is Int32)
    Assert.isFalse(([-3.14, 8e-3]) is Int64)
    Assert.isFalse(([-3.14, 8e-3]) is UInt8)
    Assert.isFalse(([-3.14, 8e-3]) is UInt16)
    Assert.isFalse(([-3.14, 8e-3]) is UInt32)
    Assert.isFalse(([-3.14, 8e-3]) is UInt64)
    Assert.isFalse(([-3.14, 8e-3]) is Float16)
    Assert.isFalse(([-3.14, 8e-3]) is Float32)
    Assert.isFalse(([-3.14, 8e-3]) is Float64)
    Assert.isFalse(([-3.14, 8e-3]) is Rune)
    Assert.isFalse(([-3.14, 8e-3]) is String)
    Assert.isFalse(([-3.14, 8e-3]) is Array<Int8>)
    Assert.isFalse(([-3.14, 8e-3]) is Array<Int16>)
    Assert.isFalse(([-3.14, 8e-3]) is Array<Int32>)
    Assert.isFalse(([-3.14, 8e-3]) is Array<Int64>)
    Assert.isFalse(([-3.14, 8e-3]) is Array<UInt8>)
    Assert.isFalse(([-3.14, 8e-3]) is Array<UInt16>)
    Assert.isFalse(([-3.14, 8e-3]) is Array<UInt32>)
    Assert.isFalse(([-3.14, 8e-3]) is Array<UInt64>)
    Assert.isFalse(([-3.14, 8e-3]) is Array<Float16>)
    Assert.isFalse(([-3.14, 8e-3]) is Array<Float32>)
    Assert.isTrue(([-3.14, 8e-3]) is Array<Float64>)
    Assert.isFalse(([-3.14, 8e-3]) is (Int64, Int64))
    Assert.isFalse(([-3.14, 8e-3]) is (Float64, Float64))
    Assert.isFalse(([-3.14, 8e-3]) is Unit)
    Assert.isFalse(([-3.14, 8e-3]) is () -> Unit)
    Assert.isFalse(([-3.14, 8e-3]) is C)
}
