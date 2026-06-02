/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_01_a01_01

  @Level:         1

  @Assertion:   4.17.1(1) e is T is an expression for type checking, and e is T is of type Bool. where e can be an
                expression of any type and T can be any type.
  @Description: Checks for expressions e of various types T and that e is T has bool type and is true when T is the
                type of e.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

func simpleFunction() {}

func getTuple(i: Int64, j: Int64) {
    (i, j)
}

class A {}
class B {}

func checkType<T>(t : T) {
    let typeCheck = t is T
    Assert.isTrue(typeCheck is Bool)
    Assert.isTrue(typeCheck)
}

main() {
    checkType(1i8)
    checkType(1i16)
    checkType(1i32)
    checkType(1i64)
    checkType(1u8)
    checkType(1u16)
    checkType(1u32)
    checkType(1u64)
    checkType(1.0f16)
    checkType(1.0f32)
    checkType(1.0f64)
    checkType(true)
    checkType('1')
    checkType("1")
    checkType(["1"])
    checkType(A())
    checkType(B())
    checkType(getTuple(1, 1))
    checkType((1, "1"))
    checkType(simpleFunction())
    checkType(simpleFunction)
    checkType(getTuple)

    0
}
