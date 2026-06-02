/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a02_01

  @Level:         1

  @Assertion: 9.5.1.1(2) Its upper bounds are generic parameters, the upperbounds may contain itself or other generic 
              parameters.

  @Description: Check upper bound containing generic parameter itself.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface Ord<T> {
    func lt(x: T): Bool
}

class Number <: Ord<Number> {
    public func lt(x: Number): Bool {
        return false
    }
}

// Upper bound contains generic parameter itself.
class GenericClass<T> where T <: Ord<T> {
    init(arg: T) {
        x = arg
    }

    var x: T
}

main() {
    let n = Number()
    Assert.isTrue(GenericClass(n).x is Number)
}

