
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a11_01

  @Level:         1

  @Assertion:   16.4(11) 8.The numeric types, Bool, Unit, Rune, String types and enum support defining const instance
                member functions.
  @Description: Checks that the numeric types, Bool, Unit, Rune, String types and enum support defining const instance
                member functions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

extend Int8 {
    const func getValue() { 1i8 }
}

extend Int16 {
    const func getValue() { 1i16 }
}

extend Int32 {
    const func getValue() { 1i32 }
}

extend Int64 {
    const func getValue() { 1i64 }
}

extend IntNative {
    const func getValue() { 1 }
}

extend UInt8 {
    const func getValue() { 1u8 }
}

extend UInt16 {
    const func getValue() { 1u16 }
}

extend UInt32 {
    const func getValue() { 1u32 }
}

extend UInt64 {
    const func getValue() { 1u64 }
}

extend UIntNative {
    const func getValue() { 1 }
}

extend Float16 {
    const func getValue() { 1.0f16 }
}

extend Float32 {
    const func getValue() { 1.0f32 }
}

extend Float64 {
    const func getValue() { 1.0f64 }
}

extend Bool {
    const func getValue() { true }
}

extend Unit {
    const func getValue() { () }
}

extend Rune {
    const func getValue() { '1' }
}

extend String {
    const func getValue() { "1" }
}

enum E { E0 }

extend E {
    const func getValue() { E0 }
}

main() {
    Assert.equals(1, 1i8.getValue())
    Assert.equals(1, 1i16.getValue())
    Assert.equals(1, 1i32.getValue())
    Assert.equals(1, 1i64.getValue())
    let iN: IntNative = 1
    Assert.equals(1, iN.getValue())
    Assert.equals(1, 1u8.getValue())
    Assert.equals(1, 1u16.getValue())
    Assert.equals(1, 1u32.getValue())
    Assert.equals(1, 1u64.getValue())
    let uN: IntNative = 1
    Assert.equals(1, uN.getValue())
    Assert.equals(1.0, 1.0f16.getValue())
    Assert.equals(1.0, 1.0f32.getValue())
    Assert.equals(1.0, 1.0f64.getValue())
    Assert.equals(true, true.getValue())
    Assert.isTrue(() == ().getValue())
    Assert.equals('1', '1'.getValue())
    Assert.equals("1", "1".getValue())
    Assert.isTrue(E.E0.getValue() is E)
}
