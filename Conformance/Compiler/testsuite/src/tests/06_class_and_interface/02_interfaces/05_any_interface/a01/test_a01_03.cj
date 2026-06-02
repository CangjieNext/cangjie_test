/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_05_a01_03

  @Level:         1

  @Assertion: 6.2.5(1)
              The Any interface is a language built-in empty interface,
              which is by default inherited by all interface types and
              implemented by all non-interface types,
              so all types can be used as subtypes of the Any type.

  @Description: Check that non-interfaces implement Any

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class A {}
struct B {}
enum C {
    E
}

main() {
    // User-defined types
    Assert.isTrue(A() is Any)
    Assert.isTrue(B() is Any)
    Assert.isTrue(C.E is Any)

    // Standard types
    Assert.isTrue(Object() is Any)

    // Numeric types
    Assert.isTrue(1i64 is Any)
    Assert.isTrue(1i32 is Any)
    Assert.isTrue(1i16 is Any)
    Assert.isTrue(1i8 is Any)
    Assert.isTrue(1u64 is Any)
    Assert.isTrue(1u32 is Any)
    Assert.isTrue(1u16 is Any)
    Assert.isTrue(1u8 is Any)
    Assert.isTrue(.1f64 is Any)
    Assert.isTrue(.1f32 is Any)
    Assert.isTrue(.1f16 is Any)

    Assert.isTrue(() is Any)
    Assert.isTrue('g' is Any)
    Assert.isTrue("vaf" is Any)
    Assert.isTrue(false is Any)

    Assert.isTrue((10, 11) is Any)
    Assert.isTrue((false, ('e', ("", (10, ())))) is Any)
    Assert.isTrue((1..100:1) is Any)
    Assert.isTrue({ => 1} is Any)
    Assert.isTrue({x: Int64 => x + 1} is Any)
    Assert.isTrue([1, 2, 3, 4] is Any)
}