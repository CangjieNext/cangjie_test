/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_01_a01_32

  @Level:         1

  @Assertion:   4.1(1) A literal is an expression with a fixed syntax. 
                For literals that contain no other expressions internally (see
                section 1.3 Literals for details), their value is the literals
                themselves, and their type can be determined by their syntax 
                (for numeric type literals, the type is determined by the 
                program context).
  @Description: Checks that float literals have proper type.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: yes

*/

import utils.assert.Assert

class C {}

main() {
    Assert.isFalse(3.1428 is Int8)
    Assert.isFalse(3.1428 is Int16)
    Assert.isFalse(3.1428 is Int32)
    Assert.isFalse(3.1428 is Int64)
    Assert.isFalse(3.1428 is UInt8)
    Assert.isFalse(3.1428 is UInt16)
    Assert.isFalse(3.1428 is UInt32)
    Assert.isFalse(3.1428 is UInt64)
    Assert.isFalse(3.1428 is Float16)
    Assert.isFalse(3.1428 is Float32)
    Assert.isTrue(3.1428 is Float64)
    Assert.isFalse(3.1428 is Rune)
    Assert.isFalse(3.1428 is String)
    Assert.isFalse(3.1428 is Array<Int64>)
    Assert.isFalse(3.1428 is Unit)
    Assert.isFalse(3.1428 is () -> Unit)
    Assert.isFalse(3.1428 is C)

    Assert.isFalse(3.1428f16 is Int8)
    Assert.isFalse(3.1428f16 is Int16)
    Assert.isFalse(3.1428f16 is Int32)
    Assert.isFalse(3.1428f16 is Int64)
    Assert.isFalse(3.1428f16 is UInt8)
    Assert.isFalse(3.1428f16 is UInt16)
    Assert.isFalse(3.1428f16 is UInt32)
    Assert.isFalse(3.1428f16 is UInt64)
    Assert.isTrue(3.1428f16 is Float16)
    Assert.isFalse(3.1428f16 is Float32)
    Assert.isFalse(3.1428f16 is Float64)
    Assert.isFalse(3.1428f16 is Rune)
    Assert.isFalse(3.1428f16 is String)
    Assert.isFalse(3.1428f16 is Array<Int64>)
    Assert.isFalse(3.1428f16 is Unit)
    Assert.isFalse(3.1428f16 is () -> Unit)
    Assert.isFalse(3.1428f16 is C)

    Assert.isFalse(3.1428f32 is Int8)
    Assert.isFalse(3.1428f32 is Int16)
    Assert.isFalse(3.1428f32 is Int32)
    Assert.isFalse(3.1428f32 is Int64)
    Assert.isFalse(3.1428f32 is UInt8)
    Assert.isFalse(3.1428f32 is UInt16)
    Assert.isFalse(3.1428f32 is UInt32)
    Assert.isFalse(3.1428f32 is UInt64)
    Assert.isFalse(3.1428f32 is Float16)
    Assert.isTrue(3.1428f32 is Float32)
    Assert.isFalse(3.1428f32 is Float64)
    Assert.isFalse(3.1428f32 is Rune)
    Assert.isFalse(3.1428f32 is String)
    Assert.isFalse(3.1428f32 is Array<Int64>)
    Assert.isFalse(3.1428f32 is Unit)
    Assert.isFalse(3.1428f32 is () -> Unit)
    Assert.isFalse(3.1428f32 is C)

    Assert.isFalse(3.1428f64 is Int8)
    Assert.isFalse(3.1428f64 is Int16)
    Assert.isFalse(3.1428f64 is Int32)
    Assert.isFalse(3.1428f64 is Int64)
    Assert.isFalse(3.1428f64 is UInt8)
    Assert.isFalse(3.1428f64 is UInt16)
    Assert.isFalse(3.1428f64 is UInt32)
    Assert.isFalse(3.1428f64 is UInt64)
    Assert.isFalse(3.1428f64 is Float16)
    Assert.isFalse(3.1428f64 is Float32)
    Assert.isTrue(3.1428f64 is Float64)
    Assert.isFalse(3.1428f64 is Rune)
    Assert.isFalse(3.1428f64 is String)
    Assert.isFalse(3.1428f64 is Array<Int64>)
    Assert.isFalse(3.1428f64 is Unit)
    Assert.isFalse(3.1428f64 is () -> Unit)
    Assert.isFalse(3.1428f64 is C)

    Assert.isFalse(.1 is Int8)
    Assert.isFalse(.1 is Int16)
    Assert.isFalse(.1 is Int32)
    Assert.isFalse(.1 is Int64)
    Assert.isFalse(.1 is UInt8)
    Assert.isFalse(.1 is UInt16)
    Assert.isFalse(.1 is UInt32)
    Assert.isFalse(.1 is UInt64)
    Assert.isFalse(.1 is Float16)
    Assert.isFalse(.1 is Float32)
    Assert.isTrue(.1 is Float64)
    Assert.isFalse(.1 is Rune)
    Assert.isFalse(.1 is String)
    Assert.isFalse(.1 is Array<Int64>)
    Assert.isFalse(.1 is Unit)
    Assert.isFalse(.1 is () -> Unit)
    Assert.isFalse(.1 is C)

    Assert.isFalse(123e456 is Int8)
    Assert.isFalse(123e456 is Int16)
    Assert.isFalse(123e456 is Int32)
    Assert.isFalse(123e456 is Int64)
    Assert.isFalse(123e456 is UInt8)
    Assert.isFalse(123e456 is UInt16)
    Assert.isFalse(123e456 is UInt32)
    Assert.isFalse(123e456 is UInt64)
    Assert.isFalse(123e456 is Float16)
    Assert.isFalse(123e456 is Float32)
    Assert.isTrue(123e456 is Float64)
    Assert.isFalse(123e456 is Rune)
    Assert.isFalse(123e456 is String)
    Assert.isFalse(123e456 is Array<Int64>)
    Assert.isFalse(123e456 is Unit)
    Assert.isFalse(123e456 is () -> Unit)
    Assert.isFalse(123e456 is C)

    Assert.isFalse(123e456f16 is Int8)
    Assert.isFalse(123e456f16 is Int16)
    Assert.isFalse(123e456f16 is Int32)
    Assert.isFalse(123e456f16 is Int64)
    Assert.isFalse(123e456f16 is UInt8)
    Assert.isFalse(123e456f16 is UInt16)
    Assert.isFalse(123e456f16 is UInt32)
    Assert.isFalse(123e456f16 is UInt64)
    Assert.isTrue(123e456f16 is Float16)
    Assert.isFalse(123e456f16 is Float32)
    Assert.isFalse(123e456f16 is Float64)
    Assert.isFalse(123e456f16 is Rune)
    Assert.isFalse(123e456f16 is String)
    Assert.isFalse(123e456f16 is Array<Int64>)
    Assert.isFalse(123e456f16 is Unit)
    Assert.isFalse(123e456f16 is () -> Unit)
    Assert.isFalse(123e456f16 is C)

    Assert.isFalse(123e456f32 is Int8)
    Assert.isFalse(123e456f32 is Int16)
    Assert.isFalse(123e456f32 is Int32)
    Assert.isFalse(123e456f32 is Int64)
    Assert.isFalse(123e456f32 is UInt8)
    Assert.isFalse(123e456f32 is UInt16)
    Assert.isFalse(123e456f32 is UInt32)
    Assert.isFalse(123e456f32 is UInt64)
    Assert.isFalse(123e456f32 is Float16)
    Assert.isTrue(123e456f32 is Float32)
    Assert.isFalse(123e456f32 is Float64)
    Assert.isFalse(123e456f32 is Rune)
    Assert.isFalse(123e456f32 is String)
    Assert.isFalse(123e456f32 is Array<Int64>)
    Assert.isFalse(123e456f32 is Unit)
    Assert.isFalse(123e456f32 is () -> Unit)
    Assert.isFalse(123e456f32 is C)

    Assert.isFalse(123e-4f64 is Int8)
    Assert.isFalse(123e-4f64 is Int16)
    Assert.isFalse(123e-4f64 is Int32)
    Assert.isFalse(123e-4f64 is Int64)
    Assert.isFalse(123e-4f64 is UInt8)
    Assert.isFalse(123e-4f64 is UInt16)
    Assert.isFalse(123e-4f64 is UInt32)
    Assert.isFalse(123e-4f64 is UInt64)
    Assert.isFalse(123e-4f64 is Float16)
    Assert.isFalse(123e-4f64 is Float32)
    Assert.isTrue(123e-4f64 is Float64)
    Assert.isFalse(123e-4f64 is Rune)
    Assert.isFalse(123e-4f64 is String)
    Assert.isFalse(123e-4f64 is Array<Int64>)
    Assert.isFalse(123e-4f64 is Unit)
    Assert.isFalse(123e-4f64 is () -> Unit)
    Assert.isFalse(123e-4f64 is C)
}
