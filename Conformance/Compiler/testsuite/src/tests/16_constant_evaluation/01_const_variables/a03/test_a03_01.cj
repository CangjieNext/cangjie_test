
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a03_01

  @Level:         1

  @Assertion:   16.1(3) Therefore, const variables can only be of types that are supported by const expressions.
  @Description: Checks usage of const variables of supported types.
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func foo(x : Int64) { x + 1 }

interface I { }

class C <: I {
    const init() {
        const p = this
    }
}

struct S {
    const init() {
        const p = this
    }
}

enum E {
    E0(Int64)
}

main() {
    const i8 = 1i8
    Assert.equals(1i8, i8)
    const i16 = 1i16
    Assert.equals(1i16, i16)
    const i32 = 1i32
    Assert.equals(1i32, i32)
    const i64 = 1i64
    Assert.equals(1i64, i64)
    const iN : IntNative = 1
    Assert.equals(1, iN)
    const u8 = 1u8
    Assert.equals(1u8, u8)
    const u16 = 1u16
    Assert.equals(1u16, u16)
    const u32 = 1u32
    Assert.equals(1u32, u32)
    const u64 = 1u64
    Assert.equals(1u64, u64)
    const uN : UIntNative = 1
    Assert.equals(1, uN)
    const f16 = 1.0f16
    Assert.equals(1.0f16, f16)
    const f32 = 1.0f32
    Assert.equals(1.0f32, f32)
    const f64 = 1.0f64
    Assert.equals(1.0f64, f64)
    const b = true
    Assert.equals(true, b)
    const u = ()
    Assert.isTrue(() == u)
    const c = '1'
    Assert.equals('1', c)
    const s = "1"
    Assert.equals("1", s)
    const t = (1, 2)
    Assert.isTrue((1, 2) == t)
    const f = foo
    
    const co = C()
    const so = S()
    const i : I = co
}
