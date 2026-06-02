/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a02_03

  @Level:         1

  @Assertion:   4.17.2(2) When the runtime type R of e is a subtype of T, the value of e as T is Some(e), otherwise the
                value is None.
  @Description: Check for various types T1 and expressions e of type T2 that (e as T1) is None when
                T1 is a simple equatable type and T2 is not and vice versa.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

interface I {}

class C <: I {}

func asI() : I { C() } 

var none : Bool = true

func isNone<T1, T2>(x : T1) {
  let o = x as T2
  var val = match (o) {
      case None => ()
      case Some(_) => none = false
  }
}

func check1<T>(x : T) {
    none = true

    isNone<T, Int8>(x)
    isNone<T, Int16>(x)
    isNone<T, Int32>(x)
    isNone<T, Int64>(x)
    isNone<T, IntNative>(x)
    isNone<T, UInt8>(x)
    isNone<T, UInt16>(x)
    isNone<T, UInt32>(x)
    isNone<T, UInt64>(x)
    isNone<T, UIntNative>(x)
    isNone<T, Float16>(x)
    isNone<T, Float32>(x)
    isNone<T, Float64>(x)
    isNone<T, Bool>(x)
    isNone<T, Rune>(x)
    isNone<T, String>(x)
    isNone<T, Range<Int64>>(x)

    Assert.isTrue(none)
}

func check2<T>(x : T) {
    none = true

    isNone<T, C>(x)
    isNone<T, I>(x)
    isNone<T, () -> I>(x)
    isNone<T, Unit>(x)
    isNone<T, (Int64, Int64)>(x)
    isNone<T, Nothing>(x)

    Assert.isTrue(none)
}

main() {
    check1(C())
    check1(asI())
    check1(asI)
    check1(())
    check1((1, 1))

    check2(1i8)
    check2(1i16)
    check2(1i32)
    check2(1i64)
    check2(1u8)
    check2(1u16)
    check2(1u32)
    check2(1u64)
    check2(1.0f16)
    check2(1.0f32)
    check2(1.0f64)
    check2(true)
    check2('1')
    check2("1")
    check2(["1"])

    0
}
