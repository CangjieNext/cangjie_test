
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_34

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks that boolean literals have Bool type.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C {}

main() {
    Assert.isTrue(true is Bool)
    Assert.isFalse(true is Int8)
    Assert.isFalse(true is Int16)
    Assert.isFalse(true is Int32)
    Assert.isFalse(true is Int64)
    Assert.isFalse(true is UInt8)
    Assert.isFalse(true is UInt16)
    Assert.isFalse(true is UInt32)
    Assert.isFalse(true is UInt64)
    Assert.isFalse(true is Float16)
    Assert.isFalse(true is Float32)
    Assert.isFalse(true is Float64)
    Assert.isFalse(true is Rune)
    Assert.isFalse(true is String)
    Assert.isFalse(true is Array<Int64>)
    Assert.isFalse(true is Unit)
    Assert.isFalse(true is () -> Unit)
    Assert.isFalse(true is C)

    Assert.isTrue(false is Bool)
    Assert.isFalse(false is Int8)
    Assert.isFalse(false is Int16)
    Assert.isFalse(false is Int32)
    Assert.isFalse(false is Int64)
    Assert.isFalse(false is UInt8)
    Assert.isFalse(false is UInt16)
    Assert.isFalse(false is UInt32)
    Assert.isFalse(false is UInt64)
    Assert.isFalse(false is Float16)
    Assert.isFalse(false is Float32)
    Assert.isFalse(false is Float64)
    Assert.isFalse(false is Rune)
    Assert.isFalse(false is String)
    Assert.isFalse(false is Array<Int64>)
    Assert.isFalse(false is Unit)
    Assert.isFalse(false is () -> Unit)
    Assert.isFalse(false is C)
}
