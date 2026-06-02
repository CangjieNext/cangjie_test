
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a31_01

  @Level:         1

  @Assertion:   4.23(31) Note that when _appears in the left tuple, it means that the result at the corresponding
                position of the tuple on the right of the = is ignored (it means that the type check at this position
                will always pass).
  @Description: Checks that assignment is permitted for different types of the value on the specific position of the
                right tuple when the left tuple has _ on the same position.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C {}

main() {
    var a = 1
    var b = 1

    b++
    (_, a) = (1i8, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1i16, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1i32, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1i64, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1u8, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1u16, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1u32, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1u64, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1.0f16, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1.0f32, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1.0f64, b)
    Assert.equals(b, a)
    b++
    (_, a) = ((), b)
    Assert.equals(b, a)
    b++
    (_, a) = (r'1', b)
    Assert.equals(b, a)
    b++
    (_, a) = ("1", b)
    Assert.equals(b, a)
    b++
    (_, a) = ({ => 1}, b)
    Assert.equals(b, a)
    b++
    (_, a) = (1..2, b)
    Assert.equals(b, a)
    b++
    (_, a) = ((1, 2), b)
    Assert.equals(b, a)
    b++
    (_, a) = (C(), b)
    Assert.equals(b, a)
    b++
    (_, a) = (do { break } while(false), b)
    Assert.equals(b, a)
}

