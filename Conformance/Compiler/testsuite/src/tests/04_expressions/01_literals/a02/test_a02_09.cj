
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a02_09

  @Level:         1

  @Assertion:   4.1(2)
                A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks that unit literals have Unit type. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C {}

main() {
    Assert.isFalse(() is (Int64, Int64))
    Assert.isFalse(() is (Int8, Int64))
    Assert.isFalse(() is (Int16, Int64))
    Assert.isFalse(() is (Int32, Int64))
    Assert.isFalse(() is (Int64, Int8))
    Assert.isFalse(() is (Int64, Int16))
    Assert.isFalse(() is (Int64, Int32))
    Assert.isFalse(() is (UInt64, UInt64))
    Assert.isFalse(() is (UInt8, UInt64))
    Assert.isFalse(() is (UInt16, UInt64))
    Assert.isFalse(() is (UInt32, UInt64))
    Assert.isFalse(() is (UInt64, UInt8))
    Assert.isFalse(() is (UInt64, UInt16))
    Assert.isFalse(() is (UInt64, UInt32))
    Assert.isFalse(() is (Int64, UInt64))
    Assert.isFalse(() is (Int8, UInt64))
    Assert.isFalse(() is (Int16, UInt64))
    Assert.isFalse(() is (Int32, UInt64))
    Assert.isFalse(() is (Int64, UInt8))
    Assert.isFalse(() is (Int64, UInt16))
    Assert.isFalse(() is (Int64, UInt32))
    Assert.isFalse(() is (UInt64, Int64))
    Assert.isFalse(() is (UInt8, Int64))
    Assert.isFalse(() is (UInt16, Int64))
    Assert.isFalse(() is (UInt32, Int64))
    Assert.isFalse(() is (UInt64, Int8))
    Assert.isFalse(() is (UInt64, Int16))
    Assert.isFalse(() is (UInt64, Int32))
    Assert.isFalse((()) is (Float64, Float64))
    Assert.isFalse((()) is (Float16, Float64))
    Assert.isFalse((()) is (Float32, Float64))
    Assert.isFalse((()) is (Float64, Float16))
    Assert.isFalse((()) is (Float64, Float32))    
    Assert.isFalse(() is Bool)
    Assert.isFalse(() is Int8)
    Assert.isFalse(() is Int16)
    Assert.isFalse(() is Int32)
    Assert.isFalse(() is Int64)
    Assert.isFalse(() is UInt8)
    Assert.isFalse(() is UInt16)
    Assert.isFalse(() is UInt32)
    Assert.isFalse(() is UInt64)
    Assert.isFalse(() is Float16)
    Assert.isFalse(() is Float32)
    Assert.isFalse(() is Float64)
    Assert.isFalse(() is Rune)
    Assert.isFalse(() is String)
    Assert.isFalse(() is Array<Int8>)
    Assert.isFalse(() is Array<Int16>)
    Assert.isFalse(() is Array<Int32>)
    Assert.isFalse(() is Array<Int64>)
    Assert.isFalse(() is Array<UInt8>)
    Assert.isFalse(() is Array<UInt16>)
    Assert.isFalse(() is Array<UInt32>)
    Assert.isFalse(() is Array<UInt64>)
    Assert.isTrue(() is Unit)
    Assert.isFalse(() is () -> Unit)
    Assert.isFalse(() is C)
}
