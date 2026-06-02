/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_02_a03_01

  @Level:         1

  @Assertion: 9.4.2(3) 
              class C<T1, T2> {...} // generic class 
              interface I<T1> {...} // generic interface 
              type BinaryOperator<T> = (T, T) -> T  // generic typealias 

  @Description: Check the examples provided.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C<T1, T2> {
    init(arg1: T1, arg2: T2) {
        x1 = arg1
        x2 = arg2
    }

    var x1: T1
    var x2: T2
}

interface I<T1> {
    static func id(x: T1) {
        return x
    }
}

type BinaryOperator<T> = (T, T) -> T

func getFirst<T>(x: T, y: T): T {
    return x
}

main() {
    Assert.isTrue(C<Int64, String>(42, "hello").x1 is Int64)
    Assert.isTrue(C<Int64, String>(42, "hello").x2 is String)
    Assert.isTrue(I<Int64>.id(42) is Int64)
    Assert.isTrue(getFirst<Int64> is BinaryOperator<Int64>)
}

