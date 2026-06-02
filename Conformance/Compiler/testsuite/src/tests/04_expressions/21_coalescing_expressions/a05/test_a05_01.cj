
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_21_a05_01

  @Level:         1

  @Assertion:   4.21(5) 3. When the value of e1 is Option<T>.Some(v), the value of e1 ?? e2 is equal to the value of v
                (e2 will not be evaluated, i.e., ?? is short-circuit).
  @Description: Checks that e1 ?? e2 = v if e1 = Option<T>.Some(v) for various T. Checks that e2 is not evaluated.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

class C { 
    var x = 0
    C(y : Int64) {
        x = y
    }
}

func checkCoalescing<T>(x : T) where T <: Equatable<T> {
    Assert.equals(x, Option<T>.Some(x) ?? throw(Exception("Should not be evaluated")))
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
    let tuple = Some((1, 2)) ?? throw(Exception("Should not be evaluated"))
    Assert.equals(1, tuple[0])
    Assert.equals(2, tuple[1])
    let obj = Some(C(1)) ?? throw(Exception("Should not be evaluated"))
    Assert.equals(1, obj.x)
}

