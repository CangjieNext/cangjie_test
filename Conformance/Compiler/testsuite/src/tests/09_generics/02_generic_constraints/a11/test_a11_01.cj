/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a11_01

  @Level:         1

  @Assertion: 9.2(11) The Syntax of generic constraints is as follows: 
              upperBounds
                  : type ('&' type)*
                  ;
              genericConstraints
                  : 'where' identifier '<:' upperBounds (',' identifier '<:' upperBounds)*
                  ;

  @Description:  Check single upper bound within single constraint.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert


open class Animal {}

class Dog <: Animal {}

// class
class GenericClass<T> where T <: Animal {

    init(arg: T) {
        x = arg
    }

    func isDog() {
        return x is Dog
    }

    var x: T
}

// interface
interface GenericInterface<T> where T <: Animal {
    func isDog(x: T) {
        return x is Dog
    }
}

class IFaceImpl <: GenericInterface<Dog> {}

// struct
struct GenericStruct<T> where T <: Animal {
    GenericStruct(var x!: T) {}
}

// typealias
type IFaceAlias<T> = GenericInterface<T>

class IFaceDogImpl <: IFaceAlias<Dog> {}

// function
func isDog<T>(x: T) where T <: Animal {
    return x is Dog
}

// enum
enum GenericEnum<T> where T <: Animal {
    | Data(T)
    | Code(Int64)
}

main() {
    var d = Dog()

    Assert.isTrue(GenericClass(d).isDog())

    Assert.isTrue(IFaceImpl().isDog(d))

    Assert.isTrue(GenericStruct<Dog>(x: d).x is Dog)

    Assert.isTrue(IFaceDogImpl().isDog(d))

    Assert.isTrue(isDog(d))

    let value = match (GenericEnum<Dog>.Data(d)) {
        case Data(x) => 1
        case Code(x) => 0
    }
    Assert.equals(1, value)
}

