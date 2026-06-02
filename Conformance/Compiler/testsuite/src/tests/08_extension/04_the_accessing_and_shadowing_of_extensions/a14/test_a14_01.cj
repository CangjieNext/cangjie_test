/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a14_01

  @Level:         1

  @Assertion:       8.4(14) When a generic type is extended, the generic constraints of different extensions can 
                    be different.

  @Description:     Check that extensions of generic type can have different different generic constraints.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

class MyClass<X> {}

extend<Z> MyClass<Z>{ 
    func myZFunc() {
        12
    }
}

extend<Y> MyClass<Y> { 
    func myYFunc() {
        myZFunc() + 1
    }
}

struct MyStruct<X> {}

extend<Z> MyStruct<Z>  { 
    func myZFunc(d: Bool) {
        !d
    }
}

extend<Y> MyStruct<Y>  { 
    func myYFunc(a: Rune) {
        "${a}"
    }
}

enum myEnum<A> {
    B
}

extend<K> myEnum<K>  { 
    func myKFunc(): Int32 {
        -6
    }
}

extend<R> myEnum<R>  { 
    func myRFunc(a: R) {
        a
    }
}

main(): Unit {
    var myClassImpl0 = MyClass<Int64>()
    Assert.equals(13, myClassImpl0.myYFunc())
    Assert.equals(12, myClassImpl0.myZFunc())

    var myClassImpl1 = MyClass<Int32>()
    Assert.equals(12, myClassImpl1.myZFunc())

    var myStructImpl0 = MyStruct<Bool>()
    Assert.equals(false, myStructImpl0.myZFunc(true))

    var myStructImpl1 = MyStruct<Rune>()
    Assert.equals("F", myStructImpl1.myYFunc(r'F'))

    var myVar: Float16 = 15.33
    Assert.equals(myVar, myEnum<Float16>.B.myRFunc(myVar))
    Assert.equals(-6, myEnum<Int32>.B.myKFunc())
}
