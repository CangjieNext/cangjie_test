
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_35

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks that string literals have String type. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C {}

main() {
    Assert.isFalse("" is Bool)
    Assert.isFalse("" is Int8)
    Assert.isFalse("" is Int16)
    Assert.isFalse("" is Int32)
    Assert.isFalse("" is Int64)
    Assert.isFalse("" is UInt8)
    Assert.isFalse("" is UInt16)
    Assert.isFalse("" is UInt32)
    Assert.isFalse("" is UInt64)
    Assert.isFalse("" is Float16)
    Assert.isFalse("" is Float32)
    Assert.isFalse("" is Float64)
    Assert.isFalse("" is Rune)
    Assert.isTrue("" is String)
    Assert.isFalse("" is Array<Int64>)
    Assert.isFalse("" is Unit)
    Assert.isFalse("" is () -> Unit)
    Assert.isFalse("" is C)

    Assert.isFalse("Hello" is Bool)
    Assert.isFalse("Hello" is Int8)
    Assert.isFalse("Hello" is Int16)
    Assert.isFalse("Hello" is Int32)
    Assert.isFalse("Hello" is Int64)
    Assert.isFalse("Hello" is UInt8)
    Assert.isFalse("Hello" is UInt16)
    Assert.isFalse("Hello" is UInt32)
    Assert.isFalse("Hello" is UInt64)
    Assert.isFalse("Hello" is Float16)
    Assert.isFalse("Hello" is Float32)
    Assert.isFalse("Hello" is Float64)
    Assert.isFalse("Hello" is Rune)
    Assert.isTrue("Hello" is String)
    Assert.isFalse("Hello" is Array<Int64>)
    Assert.isFalse("Hello" is Unit)
    Assert.isFalse("Hello" is () -> Unit)
    Assert.isFalse("Hello" is C)
}
