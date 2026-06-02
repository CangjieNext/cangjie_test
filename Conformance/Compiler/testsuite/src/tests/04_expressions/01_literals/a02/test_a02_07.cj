
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a02_07

  @Level:         1

  @Assertion:   4.1(2)
                A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks that tuple literals have proper tuple type. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C {}

main() {
    Assert.isTrue((0, 1) is (Int64, Int64))
    Assert.isFalse((0, 1) is (Int8, Int64))
    Assert.isFalse((0, 1) is (Int16, Int64))
    Assert.isFalse((0, 1) is (Int32, Int64))
    Assert.isFalse((0, 1) is (Int64, Int8))
    Assert.isFalse((0, 1) is (Int64, Int16))
    Assert.isFalse((0, 1) is (Int64, Int32))
    Assert.isFalse((0, 1) is (UInt64, UInt64))
    Assert.isFalse((0, 1) is (UInt8, UInt64))
    Assert.isFalse((0, 1) is (UInt16, UInt64))
    Assert.isFalse((0, 1) is (UInt32, UInt64))
    Assert.isFalse((0, 1) is (UInt64, UInt8))
    Assert.isFalse((0, 1) is (UInt64, UInt16))
    Assert.isFalse((0, 1) is (UInt64, UInt32))
    Assert.isFalse((0, 1) is (Int64, UInt64))
    Assert.isFalse((0, 1) is (Int8, UInt64))
    Assert.isFalse((0, 1) is (Int16, UInt64))
    Assert.isFalse((0, 1) is (Int32, UInt64))
    Assert.isFalse((0, 1) is (Int64, UInt8))
    Assert.isFalse((0, 1) is (Int64, UInt16))
    Assert.isFalse((0, 1) is (Int64, UInt32))
    Assert.isFalse((0, 1) is (UInt64, Int64))
    Assert.isFalse((0, 1) is (UInt8, Int64))
    Assert.isFalse((0, 1) is (UInt16, Int64))
    Assert.isFalse((0, 1) is (UInt32, Int64))
    Assert.isFalse((0, 1) is (UInt64, Int8))
    Assert.isFalse((0, 1) is (UInt64, Int16))
    Assert.isFalse((0, 1) is (UInt64, Int32))
    Assert.isFalse(((0, 1)) is (Float64, Float64))
    Assert.isFalse(((0, 1)) is (Float16, Float64))
    Assert.isFalse(((0, 1)) is (Float32, Float64))
    Assert.isFalse(((0, 1)) is (Float64, Float16))
    Assert.isFalse(((0, 1)) is (Float64, Float32))    
    Assert.isFalse((0, 1) is Bool)
    Assert.isFalse((0, 1) is Int8)
    Assert.isFalse((0, 1) is Int16)
    Assert.isFalse((0, 1) is Int32)
    Assert.isFalse((0, 1) is Int64)
    Assert.isFalse((0, 1) is UInt8)
    Assert.isFalse((0, 1) is UInt16)
    Assert.isFalse((0, 1) is UInt32)
    Assert.isFalse((0, 1) is UInt64)
    Assert.isFalse((0, 1) is Float16)
    Assert.isFalse((0, 1) is Float32)
    Assert.isFalse((0, 1) is Float64)
    Assert.isFalse((0, 1) is Rune)
    Assert.isFalse((0, 1) is String)
    Assert.isFalse((0, 1) is Array<Int8>)
    Assert.isFalse((0, 1) is Array<Int16>)
    Assert.isFalse((0, 1) is Array<Int32>)
    Assert.isFalse((0, 1) is Array<Int64>)
    Assert.isFalse((0, 1) is Array<UInt8>)
    Assert.isFalse((0, 1) is Array<UInt16>)
    Assert.isFalse((0, 1) is Array<UInt32>)
    Assert.isFalse((0, 1) is Array<UInt64>)
    Assert.isFalse((0, 1) is Unit)
    Assert.isFalse((0, 1) is () -> Unit)
    Assert.isFalse((0, 1) is C)

    Assert.isTrue((3.14, 2e7) is (Float64, Float64))
    Assert.isFalse((3.14, 2e7) is (Float16, Float64))
    Assert.isFalse((3.14, 2e7) is (Float32, Float64))
    Assert.isFalse((3.14, 2e7) is (Float64, Float16))
    Assert.isFalse((3.14, 2e7) is (Float64, Float32))
    Assert.isFalse((3.14, 2e7) is (Int64, Int64))
    Assert.isFalse((3.14, 2e7) is (Int8, Int64))
    Assert.isFalse((3.14, 2e7) is (Int16, Int64))
    Assert.isFalse((3.14, 2e7) is (Int32, Int64))
    Assert.isFalse((3.14, 2e7) is (Int64, Int8))
    Assert.isFalse((3.14, 2e7) is (Int64, Int16))
    Assert.isFalse((3.14, 2e7) is (Int64, Int32))
    Assert.isFalse((3.14, 2e7) is Bool)
    Assert.isFalse((3.14, 2e7) is Int8)
    Assert.isFalse((3.14, 2e7) is Int16)
    Assert.isFalse((3.14, 2e7) is Int32)
    Assert.isFalse((3.14, 2e7) is Int64)
    Assert.isFalse((3.14, 2e7) is UInt8)
    Assert.isFalse((3.14, 2e7) is UInt16)
    Assert.isFalse((3.14, 2e7) is UInt32)
    Assert.isFalse((3.14, 2e7) is UInt64)
    Assert.isFalse((3.14, 2e7) is Float16)
    Assert.isFalse((3.14, 2e7) is Float32)
    Assert.isFalse((3.14, 2e7) is Float64)
    Assert.isFalse((3.14, 2e7) is Rune)
    Assert.isFalse((3.14, 2e7) is String)
    Assert.isFalse((3.14, 2e7) is Array<Int8>)
    Assert.isFalse((3.14, 2e7) is Array<Int16>)
    Assert.isFalse((3.14, 2e7) is Array<Int32>)
    Assert.isFalse((3.14, 2e7) is Array<Int64>)
    Assert.isFalse((3.14, 2e7) is Array<UInt8>)
    Assert.isFalse((3.14, 2e7)is Array<UInt16>)
    Assert.isFalse((3.14, 2e7) is Array<UInt32>)
    Assert.isFalse((3.14, 2e7) is Array<UInt64>)
    Assert.isFalse((3.14, 2e7) is Unit)
    Assert.isFalse((3.14, 2e7) is () -> Unit)
    Assert.isFalse((3.14, 2e7) is C)
}
