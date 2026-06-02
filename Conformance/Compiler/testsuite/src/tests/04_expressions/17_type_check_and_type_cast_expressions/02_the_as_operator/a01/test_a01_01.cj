/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_02_a01_01

  @Level:         1

  @Assertion:   4.17.2(1) e as T is an expression for type conversion, and the type of e as T is Option<T>. where e can
                be an expression of any type and T can be any concrete type.
  @Description: Checks compilation and execution of a program using `as` operator for expressions e of various types
                and that the type of e as T is Option<T>. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: Ignore

*/

import utils.assert.Assert

func simpleFunction() {}

func getTuple(i: Int64, j: Int64) {
    (i, j)
}

class A {}
class B {}

interface I {}

func typeCastInner<T1, T2>(t : T1) {
    Assert.isTrue((t as T2) is Option<T2>)
}

func typeCast<T>(t : T) {
    typeCastInner<T, Int8>(t)
    typeCastInner<T, Int16>(t)
    typeCastInner<T, Int32>(t)
    typeCastInner<T, Int64>(t)
    typeCastInner<T, UInt8>(t)
    typeCastInner<T, UInt16>(t)
    typeCastInner<T, UInt32>(t)
    typeCastInner<T, UInt64>(t)
    typeCastInner<T, Float16>(t)
    typeCastInner<T, Float32>(t)
    typeCastInner<T, Float64>(t)
    typeCastInner<T, Bool>(t)
    typeCastInner<T, Rune>(t)
    typeCastInner<T, String>(t)
    typeCastInner<T, Array<UInt8>>(t)
    typeCastInner<T, Array<String>>(t)
    typeCastInner<T, A>(t)
    typeCastInner<T, B>(t)
    typeCastInner<T, (Int64, Int64)>(t)
    typeCastInner<T, (Int64, String)>(t)
    typeCastInner<T, Unit>(t)
    typeCastInner<T, () -> Unit>(t)
    typeCastInner<T, (Int64, Int64) -> (Int64, Int64)>(t)

    typeCastInner<T, Nothing>(t)
    typeCastInner<T, I>(t)
}

main() {
    typeCast(1i8)
    typeCast(1i16)
    typeCast(1i32)
    typeCast(1i64)
    typeCast(1u8)
    typeCast(1u16)
    typeCast(1u32)
    typeCast(1u64)
    typeCast(1.0f16)
    typeCast(1.0f32)
    typeCast(1.0f64)
    typeCast(true)
    typeCast('1')
    typeCast("1")
    typeCast(["1"])
    typeCast(A())
    typeCast(B())
    typeCast(getTuple(1, 1))
    typeCast((1, "1"))
    typeCast(simpleFunction())
    typeCast(simpleFunction)
    typeCast(getTuple)
    do { typeCast(break) } while(false)

    0
}
