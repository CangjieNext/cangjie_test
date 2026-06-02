/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a02_02

  @Level:         1

  @Assertion: 9.5.1.1(2) Its upper bounds are generic parameters, the upperbounds may contain itself or other generic 
              parameters.
              
  @Description: Check upper bound containing other generic parameter.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface Mul<T> {
    func mul(x: T): T
}

class Vector {}

class Scalar <: Mul<Vector> {
    public func mul(x: Vector): Vector {
        return x
    }
}

// Upper bound contains other generic parameter.
class GenericClass<S, V> where S <: Mul<V> {
    init(arg1: S, arg2: V) {
        s = arg1
        v = arg2
    }

    var s: S
    var v: V
}

main() {
    let s = Scalar()
    let v = Vector()
    Assert.isTrue(GenericClass<Scalar, Vector>(s, v).s is Scalar)
    Assert.isTrue(GenericClass<Scalar, Vector>(s, v).v is Vector)
}

