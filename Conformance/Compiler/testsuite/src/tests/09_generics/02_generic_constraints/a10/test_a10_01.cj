/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a10_01

  @Level:         1

  @Assertion: 9.2(10) Constraints of different type parameters need to be separated by “,”.

  @Description: Check constraints for different type parameters separated by ",".

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert


open class Animal {}

open class Shape {}

class Dog <: Animal {}

class Rect <: Shape {}

// class
class GenericClass<T, U> where T <: Animal, U <: Shape {

    init(arg1: T, arg2: U) {
        x = arg1
        y = arg2
    }

    func get_x() {
        return x
    }

    func get_y() {
        return y
    }

    var x: T
    var y: U
}

// interface
interface GenericInterface<T, U> where T <: Animal, U <: Shape {

    func isAnimal(x: T) {
        return x is Animal
    }

    func isShape(x: U) {
        return x is Shape
    }
}

class IFaceImpl <: GenericInterface<Dog, Rect> {}

// struct
struct GenericStruct<T, U> where T <: Animal, U <: Shape {
    GenericStruct(var x!: T, var y!: U) {}
}

// typealias
type IFaceAlias<T, U> = GenericInterface<T, U>

class IFaceAliasImpl <: IFaceAlias<Dog, Rect> {}

// function
func make_tuple<T, U>(x: T, y: U): (T, U) where T <: Animal, U <: Shape {
    return (x, y)
}

// enum
enum GenericEnum<T, U> where T <: Animal, U <: Shape {
    | DataT(T)
    | DataU(U)
    | ECode(Int64)
}

main() {
    var d = Dog()
    var r = Rect()

    Assert.isTrue(GenericClass(d, r).get_x() is Animal)
    Assert.isTrue(GenericClass(d, r).get_y() is Shape)

    Assert.isTrue(IFaceImpl().isAnimal(d))
    Assert.isTrue(IFaceImpl().isShape(r))

    Assert.isTrue(GenericStruct<Dog, Rect>(x: d, y: r).x is Animal)
    Assert.isTrue(GenericStruct<Dog, Rect>(x: d, y: r).y is Shape)

    Assert.isTrue(IFaceAliasImpl().isAnimal(d))
    Assert.isTrue(IFaceAliasImpl().isShape(r))

    Assert.isTrue(make_tuple(d, r)[0] is Animal)
    Assert.isTrue(make_tuple(d, r)[1] is Shape)

    let valueDog = match ({=> GenericEnum<Dog, Rect>.DataT(d)}()) {
        case DataT(x) => 1
        case DataU(x) => 2
        case ECode(x) => 3
    }
    Assert.equals(1, valueDog)

    let valueRect = match (GenericEnum<Dog, Rect>.DataU(r)) {
        case DataT(x) => 1
        case DataU(x) => 2
        case ECode(x) => 3
    }
    Assert.equals(2, valueRect)
}

