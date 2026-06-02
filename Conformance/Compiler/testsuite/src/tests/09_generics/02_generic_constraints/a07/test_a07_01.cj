/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a07_01

  @Level:         1

  @Assertion: 9.2(7) A type variable can be constrained by multiple upperbound.

  @Description: Check type variable constrained by two upper bounds.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface Printable {}

open class Animal {}

class Dog <: Animal & Printable {}

// class
class GenericClass<T> where T <: Animal & Printable {

    init(arg: T) {
        x = arg
    }

    func get() {
        return x
    }

    var x: T
}

// interface
interface GenericInterface<T> where T <: Animal & Printable {
    func isAnimal(x: T) {
        return x is Animal
    }

    func isPrintable(x: T) {
        return x is Printable
    }
}

class IFaceImpl <: GenericInterface<Dog> {}

// struct
struct GenericStruct<T> where T <: Animal & Printable {
    GenericStruct(var x!: T) {}
}

// typealias
type IFaceAlias<T> = GenericInterface<T>

class IFaceAliasImpl <: IFaceAlias<Dog> {}

// function
func id<T>(x: T) where T <: Animal & Printable {
    return x
}

// enum
enum GenericEnum<T> where T <: Animal & Printable {
    | Data(T)
    | Code(Int64)
}

main() {
    var a = Dog()

    Assert.isTrue(GenericClass(a).get() is Animal)
    Assert.isTrue(GenericClass(a).get() is Printable)

    Assert.isTrue(IFaceImpl().isAnimal(a))
    Assert.isTrue(IFaceImpl().isPrintable(a))

    Assert.isTrue(GenericStruct<Dog>(x: a).x is Animal)
    Assert.isTrue(GenericStruct<Dog>(x: a).x is Printable)

    Assert.isTrue(IFaceAliasImpl().isAnimal(a))
    Assert.isTrue(IFaceAliasImpl().isPrintable(a))

    Assert.isTrue(id(a) is Animal)
    Assert.isTrue(id(a) is Printable)

    let value = match (GenericEnum<Dog>.Data(a)) {
        case Data(x) => 1
        case Code(x) => 0
    }
    Assert.equals(1, value)
}

