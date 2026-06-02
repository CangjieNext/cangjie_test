
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_21_a06_01

  @Level:         1

  @Assertion:   4.21(6) When the value of e1 is Option<T>.None, the value of e1 ?? e2 is equal to the value of e2.
  @Description: Checks that e1 ?? e2 = v if e1 = Option<T>.None for various T.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

class C { 
    var x = 0
    C(y : Int64) {
        x = y
    }
}

func checkCoalescing<T>(x : T) where T <: Equatable<T> {
    Assert.equals(x, Option<T>.None ?? x)
}

main() {
    checkCoalescing(1i8)
    checkCoalescing(1i16)
    checkCoalescing(1i32)
    checkCoalescing(1i64)
    checkCoalescing(1u8)
    checkCoalescing(1u16)
    checkCoalescing(1u32)
    checkCoalescing(1u64)
    checkCoalescing(1.0f16)
    checkCoalescing(1.0f32)
    checkCoalescing(1.0f64)
    checkCoalescing("1")
    checkCoalescing(r'1')
    checkCoalescing(true)
    let tuple = Option<(Int64, Int64)>.None ?? (2, 1)
    Assert.equals(2, tuple[0])
    Assert.equals(1, tuple[1])
    let obj = Option<C>.None ?? C(2)
    Assert.equals(C(2).x, obj.x)
}
