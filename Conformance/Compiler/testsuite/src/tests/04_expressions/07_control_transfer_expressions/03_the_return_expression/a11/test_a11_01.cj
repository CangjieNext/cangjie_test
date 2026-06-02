
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_03_a11_01

  @Level:         1

  @Assertion:   4.7.3(11) It should be noted that, the type of return e is not the type of expr or Unit if expr is
                missing. Rather it is Nothing type. 
  @Description: Checks that return and return e have Nothing type. 
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a11.cj
  @CompileWarning: ignore
  @Issue: 0006505

*/

import aux_a11.*

import utils.assert.Assert

class C {
    let x : Int64

    C(y : Int64) { x = y }
}

struct S {
    let x : Int64

    S(y : Int64) { x = y }
}

func f<T>(x : T) {
    Assert.isTrue((return x) is Nothing)
    return x
}

func g() {
    Assert.isTrue((return) is Nothing)
}

main(): Unit {
    @check(1i8)
    @check(1i16)
    @check(1i32)
    @check(1i64)
    @check(IntNative(1))
    @check(1u8)
    @check(1u16)
    @check(1u32)
    @check(1u64)
    @check(UIntNative(1))
    @check(1.0f16)
    @check(1.0f32)
    @check(1.0f64)
    @check(true)
    @check('1')
    @check("1")
    @check((1, 2))
    @check([1])
    @check(1..2)
    @check(())
    @check(C(1))
    @check(S(1))
    g()
    Assert.pass()
}
