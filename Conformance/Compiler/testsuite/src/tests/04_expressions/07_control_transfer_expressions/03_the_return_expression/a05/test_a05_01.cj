
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_07_03_a05_01

  @Level:         1

  @Assertion:   4.7.3(5) If a function contains a return expression return expr, the value of expr is the return value
                of the function. 
  @Description: Check returning at the end and in the middle of the function.
  @Mode: run
  @Negative: no
  @Structure: complex-main
  @Dependencies: aux_a05.cj
  @CompileWarning: no

*/

import aux_a05.*

import utils.assert.Assert

class C {
    let x : Int64

    C(y : Int64) { x = y }

    operator func ==(other : C) { x == other.x }
}

struct S {
    let x : Int64

    S(y : Int64) { x = y }

    operator func ==(other : S) { x == other.x }
}

type Tuple = (Int64, Int64)
type Array = Array<Int64>
type Range = Range<Int64>

func f<T>(x : T) { x }

main() {
    @check[Int8](1i8)
    @check[Int16](1i16)
    @check[Int32](1i32)
    @check[Int64](1i64)
    @check[IntNative](1)
    @check[UInt8](1u8)
    @check[UInt16](1u16)
    @check[UInt32](1u32)
    @check[UInt64](1u64)
    @check[UIntNative](1)
    @check[Float16](1.0f16)
    @check[Float32](1.0f32)
    @check[Float64](1.0f64)
    @check[Bool](true)
    @check[Rune](r'1')
    @check[String]("1")
    @check[Tuple]((1, 2))
    @check[Array]([1])
    @check[Range](1..2)
    @check[Unit](())
    @check[C](C(1))
    @check[S](S(1))

    Assert.isTrue(true)
}
