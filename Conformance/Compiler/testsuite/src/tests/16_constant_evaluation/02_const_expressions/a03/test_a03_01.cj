
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Comment:     This assertion is a part of the list with the heading
                "The following expressions are all const expressions."
  @Name:     16_02_a03_01

  @Level:         1

  @Assertion:   16.2(3) 1.literals of type Numeric, Bool, Unit, Rune, String (excluding interpolated string).
  @Description: Checks that literals of type Numeric, Bool, Unit, Rune, String are const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

main() {
    const i8 = 1i8
    const i16 = 1i16
    const i32 = 1i32
    const i64 = 1i64
    const u8 = 1u8
    const u16 = 1u16
    const u32 = 1u32
    const u64 = 1u64
    const f16 = 1.0f16
    const f32 = 1.0f32
    const f64 = 1.0f64
    const b = true
    const u = ()
    const c = '1'
    const s = "1"

    Assert.equals(1, i8)
    Assert.equals(1, i16)
    Assert.equals(1, i32)
    Assert.equals(1, i64)
    Assert.equals(1, u8)
    Assert.equals(1, u16)
    Assert.equals(1, u32)
    Assert.equals(1, u64)
    Assert.equals(1.0, f16)
    Assert.equals(1.0, f32)
    Assert.equals(1.0, f64)
    Assert.equals(true, b)
    Assert.equals((), ())
    Assert.equals('1', c)
    Assert.equals("1", s)

    return 0
}
