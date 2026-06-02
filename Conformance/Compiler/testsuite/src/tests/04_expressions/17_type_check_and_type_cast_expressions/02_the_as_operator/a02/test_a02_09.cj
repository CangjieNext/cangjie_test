/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_09

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check that (e as T2) is Some(_) when e has type T1, T1 is any class/interface type, and T2
                is the Object type and is None when T1 isn't.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

import utils.assert.Assert


interface I {}

class A <: I {}

func asI() : I { A() }

open class B {}

public class TestA0209 {}

func asObject<T>(t : T, expected : Bool) {
    let o = t as Object
    var val = match (o) {
        case None => Assert.isFalse(expected)
        case Some(_) => Assert.isTrue(expected)
    }
}

main() {
    asObject(1i8, false)
    asObject(1i16, false)
    asObject(1i32, false)
    asObject(1i64, false)
    asObject(1u8, false)
    asObject(1u16, false)
    asObject(1u32, false)
    asObject(1u64, false)
    asObject(1.0f16, false)
    asObject(1.0f32, false)
    asObject(1.0f64, false)
    asObject(true, false)
    asObject('1', false)
    asObject("1", false)
    asObject(["1"], false)
    asObject(1..2, false)
    asObject(asI, false)
    asObject((), false)
    asObject((1, 2), false)

    do { asObject(break, true) } while (false)
    asObject(A(), true)
    asObject(B(), true)
    asObject(TestA0209(), true)
    asObject(asI(), true)
    
    0
}
