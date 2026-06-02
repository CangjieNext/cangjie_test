/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_04_02_a01_01

  @Level:         1

  @Assertion: 9.4.2(1) If one or more type parameters are declared in the declaration of classes, interfaces, structs, 
              enum or typealias, they are called generic types. Syntax-wise, a type parameter is immediately followed 
              by the name (such as a class name or an interface name) and is enclosed in <>.

  @Description: Check generic types declaration.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class GenericClass<T> {
    init(arg: T) {
        x = arg
    }

    var x: T
}

interface GenericInterface<T> {
    static func id(x: T) {
        return x
    }
}

struct GenericStruct<T> {
    GenericStruct(var x!: T) {}
}

enum GenericEnum<T> {
    | Data(T)
    | Code(Int64)
}

type GenericTypeAlias<T> = GenericInterface<T>

class C {}

main() {
    Assert.isTrue(GenericClass<C>(C()).x is C)
    Assert.isTrue(GenericInterface<C>.id(C()) is C)
    Assert.isTrue(GenericStruct<C>(x: C()).x is C)
    Assert.isTrue(GenericTypeAlias<C>.id(C()) is C)

    let value = match (GenericEnum<C>.Data(C())) {
        case Data(x) => 1
        case Code(x) => 2
    }
    Assert.equals(1, value)
}

