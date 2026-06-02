/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_01_a01_01

  @Level:         1

  @Assertion: 9.5.1.1(1) For each of type parameter in a generic declaration, its upper bounds can be types.

  @Description: Check upper bound to be a type in generic declaration.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface I {}

class C <: I {}

class GenericClass<T> where T <: I {
    init(arg: T) {
        x = arg
    }

    var x: T
}

interface GenericInterface<T> where T <: I {
    static func id(x: T) {
        return x
    }
}

struct GenericStruct<T> where T <: I {
    GenericStruct(var x!: T) {}
}

enum GenericEnum<T> where T <: I {
    | Data(T)
    | Code(Int64)
}

type GenericTypeAlias<T> = GenericInterface<T>

func genericFunction<T>(x: T): T where T <: I {
    return x
}

main() {
    Assert.isTrue(GenericClass<C>(C()).x is C)
    Assert.isTrue(GenericInterface<C>.id(C()) is C)
    Assert.isTrue(GenericTypeAlias<C>.id(C()) is C)
    Assert.isTrue(GenericStruct<C>(x: C()).x is C)
    Assert.isTrue(genericFunction<C>(C()) is C)

    let value = match (GenericEnum<C>.Data(C())) {
        case Data(x) => 1
        case Code(x) => 2
    }
    Assert.equals(1, value)
}

