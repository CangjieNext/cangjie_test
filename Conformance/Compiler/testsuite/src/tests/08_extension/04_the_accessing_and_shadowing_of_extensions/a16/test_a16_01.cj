/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a16_01

  @Level:         1

  @Assertion:       8.4(16) If the constraints of two extensions are different and the constraints of the two 
                    extensions have an inclusive relationship, members in the extension with a looser constraint 
                    can be directly used in the extension with a stricter constraint; otherwise, members in the 
                    extension with a stricter constraint can not be directly used.

  @Description:     Check that members defined in looser constraint can be directly used in the extension with a 
                    stricter constraint.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

class MyClass<X> {}

extend<Z> MyClass<Z>  { 
    func myZFunc() {
        12
    }
}

extend<Y> MyClass<Y>  { 
    func myYFunc() {
        myZFunc() + 1
    }
}

struct MyStruct<X> {}

extend<Z> MyStruct<Z>  { 
    func myZFunc() {
        -6
    }
}

extend<Y> MyStruct<Y>  { 
    func myYFunc() {
        myZFunc() / 3
    }
}

enum myEnum<P> {
    K
}

extend<U> myEnum<U>  { 
    func myUFunc() {
        99
    }
}

extend<S> myEnum<S>{ 
    func mySFunc() {
        myUFunc() / 3
    }
}

main(): Unit {
    var myClassImpl0 = MyClass<Int64>()
    Assert.equals(13, myClassImpl0.myYFunc())
    Assert.equals(12, myClassImpl0.myZFunc())

    var myClassImpl1 = MyClass<Int32>()
    Assert.equals(12, myClassImpl1.myZFunc())

    var myStructImpl0 = MyStruct<Int64>()
    Assert.equals(-2, myStructImpl0.myYFunc())
    Assert.equals(-6, myStructImpl0.myZFunc())

    var myStructImpl1 = MyStruct<Int32>()
    Assert.equals(-6, myStructImpl1.myZFunc())

    Assert.equals(99, myEnum<Int64>.K.myUFunc())
    Assert.equals(33, myEnum<Int64>.K.mySFunc())

    Assert.equals(99, myEnum<Int32>.K.myUFunc())
}
