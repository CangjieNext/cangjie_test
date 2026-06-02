/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_04_a01_01

  @Level:         1

  @Assertion: 9.6.4(1) 
              enum Either<L,R> {
                  Left(T) | Right(R)
              }

              When Int32 and Bool two types are give to Either, it will be instantiated as:

              enum Either$Int32$Bool {
                  Left(Int32) | Right(Bool)
              }

  @Description: Check the instantiation for example provided.

  @Mode: run

  @Negative: no

  @Issue: 0006286

*/

import utils.assert.Assert

enum Either<L, R> {
    Left(L) | Right(R)
}

main() {
    let l = Either<Int32, Bool>.Left(42)
    let valueL = match (l) {
        case Left(x) => x
        case Right(x) => Int32(0)
    }
    Assert.isTrue(valueL is Int32)
    Assert.equals(42, valueL)

    let r = Either<Int32, Bool>.Right(true)
    let valueR = match(r) {
        case Left(x) => x
        case Right(x) => Int32(35)
    }
    Assert.isTrue(valueR is Int32)
    Assert.equals(35, valueR)
}

