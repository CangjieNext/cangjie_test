/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a03_01

  @Level:         1

  @Assertion: 9.2(3) Generic constraints are declared with <: operator after where keyword.

  @Description: Checks that constraint declaration with <: operator is recognized.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert


open class Animal {}

// class
class GenericClass<T> where T <: Animal {

    init(arg: T) {
        x = arg
    }

    func get() {
        return x
    }

    var x: T
}

// interface
interface GenericInterface<T> where T <: Animal {
    func isAnimal(x: T) {
        return x is Animal
    }
}

class IFaceImpl <: GenericInterface<Animal> {}

// struct
struct GenericStruct<T> where T <: Animal {
    GenericStruct(var x!: T) {}
}

// typealias
type IFaceAlias<T> = GenericInterface<T>

class IFaceAliasImpl <: IFaceAlias<Animal> {}

// function
func id<T>(x: T) where T <: Animal {
    return x
}

// enum
enum GenericEnum<T> where T <: Animal {
    | Data(T)
    | Code(Int64)
}

main() {
    var a = Animal()

    Assert.isTrue(GenericClass(a).get() is Animal)

    Assert.isTrue(IFaceImpl().isAnimal(a))

    Assert.isTrue(GenericStruct<Animal>(x: a).x is Animal)

    Assert.isTrue(IFaceAliasImpl().isAnimal(a))

    Assert.isTrue(id(a) is Animal)

    let value = match (GenericEnum<Animal>.Data(a)) {
        case Data(x) => 1
        case Code(x) => 0
    }
    Assert.equals(1, value)
}

