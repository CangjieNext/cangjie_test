/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a11_03

  @Level:         1

  @Assertion: 9.2(11) The Syntax of generic constraints is as follows: 
              upperBounds
                  : type ('&' type)*
                  ;
              genericConstraints
                  : 'where' identifier '<:' upperBounds (',' identifier '<:' upperBounds)*
                  ;

  @Description:  Check multiple upper bounds within multiple constraints.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

interface Printable {}

open class Animal {}

class Dog <: Animal & Printable {}

interface Drawable {}

open class Shape {}

class Rect <: Shape & Drawable {}

// class
class GenericClass<T, U> where
        T <: Animal & Printable,
        U <: Shape & Drawable {

    init(arg1: T, arg2: U) {
        x = arg1
        y = arg2
    }

    func getX() {
        return x
    }

    func getY() {
        return y
    }

    var x: T
    var y: U
}

// interface
interface GenericInterface<T, U> where
        T <: Animal & Printable,
        U <: Shape & Drawable {

    func isAnimal(x: T) {
        return x is Animal
    }

    func isPrintable(x: T) {
        return x is Printable
    }

    func isShape(x: U) {
        return x is Shape
    }

    func isDrawable(x: U) {
        return x is Drawable
    }
}

class IFaceImpl <: GenericInterface<Dog, Rect> {}

// struct
struct GenericStruct<T, U> where
        T <: Animal & Printable,
        U <: Shape & Drawable {
    GenericStruct(var x!: T, var y!: U) {}
}

// typealias
type IFaceAlias<T, U> = GenericInterface<T, U>

class IFaceAliasImpl <: IFaceAlias<Dog, Rect> {}

// function
func make_pair<T, U>(x: T,  y: U) where
        T <: Animal & Printable,
        U <: Shape & Drawable {
    return (x, y)
}

// enum
enum GenericEnum<T, U> where
        T <: Animal & Printable,
        U <: Shape & Drawable {
    | DataT(T)
    | DataU(U)
    | ECode(Int64)
}

main() {
    var d = Dog()
    var r = Rect()

    Assert.isTrue(GenericClass(d, r).getX() is Animal)
    Assert.isTrue(GenericClass(d, r).getX() is Printable)
    Assert.isTrue(GenericClass(d, r).getY() is Shape)
    Assert.isTrue(GenericClass(d, r).getY() is Drawable)

    Assert.isTrue(IFaceImpl().isAnimal(d))
    Assert.isTrue(IFaceImpl().isPrintable(d))
    Assert.isTrue(IFaceImpl().isShape(r))
    Assert.isTrue(IFaceImpl().isDrawable(r))

    Assert.isTrue(GenericStruct<Dog, Rect>(x: d, y: r).x is Animal)
    Assert.isTrue(GenericStruct<Dog, Rect>(x: d, y: r).x is Printable)
    Assert.isTrue(GenericStruct<Dog, Rect>(x: d, y: r).y is Shape)
    Assert.isTrue(GenericStruct<Dog, Rect>(x: d, y: r).y is Drawable)

    Assert.isTrue(IFaceAliasImpl().isAnimal(d))
    Assert.isTrue(IFaceAliasImpl().isPrintable(d))
    Assert.isTrue(IFaceAliasImpl().isShape(r))
    Assert.isTrue(IFaceAliasImpl().isDrawable(r))

    Assert.isTrue(make_pair(d, r)[0] is Animal)
    Assert.isTrue(make_pair(d, r)[0] is Printable)
    Assert.isTrue(make_pair(d, r)[1] is Shape)
    Assert.isTrue(make_pair(d, r)[1] is Drawable)

    let valueD = match ({=> GenericEnum<Dog, Rect>.DataT(d)}()) {
        case DataT(x) => 1
        case DataU(x) => 2
        case ECode(x) => 3
    }
    Assert.equals(1, valueD)

    let valueR = match (GenericEnum<Dog, Rect>.DataU(r)) {
        case DataT(x) => 1
        case DataU(x) => 2
        case ECode(x) => 3
    }
    Assert.equals(2, valueR)
}

