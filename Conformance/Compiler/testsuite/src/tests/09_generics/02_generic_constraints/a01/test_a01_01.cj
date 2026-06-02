/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a01_01

  @Level:         1

  @Assertion: 9.2(1) In Cangjie programming language, <: can be used to denote one type is a subtype of another type. 

  @Description: Check that subtype can be substituted as constrained type parameter.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert


open class Animal {}

class Dog <: Animal {}

class GenericClass<T> where T <: Animal {

    init(arg: T) {
        x = arg
    }

    func isDog() {
        return x is Dog
    }

    var x: T
}

func isDog<T>(x: T) where T <: Animal {
    return x is Dog
}

main() {
    var a: Animal = Animal();
    var d: Dog = Dog();

    Assert.isTrue(GenericClass(d).isDog());

    Assert.isFalse(GenericClass(a).isDog());

    Assert.isTrue(isDog(d));

    Assert.isFalse(isDog(a));
}

