/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a15_01

  @Level:         1

  @Assertion:       8.4(15) In addition to the preceding accessibility rules, whether members of other extensions 
                    of the same type can be directly used in an extension of a generic type must meet the following 
                    rules: If the constraints of two extensions are the same, the members of each other can be 
                    directly used in the two extensions.

  @Description:     Check that extensions of generic type with the same generic constraints can directly use members 
                    of own siblings.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

class MyClass<X> {}

extend<Z> MyClass<Z>{ 
    func myZFunc0() {
        myYFunc1() * 12
    }

    func myZFunc1() {
        12
    }
}

extend<Y> MyClass<Y>  { 
    func myYFunc0() {
        myZFunc1() + 1
    }

    func myYFunc1() {
        11
    }
}

struct MyStruct<X> {}

extend<Z> MyStruct<Z>  { 
    func myZFunc0(d: Bool) {
        if (d) { 
            myYFunc1(r'A') 
        } else{
            myYFunc1(r'C')
        }
    }

    func myZFunc1(d: Bool) {
        !d
    }
}

extend<Y> MyStruct<Y> { 
    func myYFunc0(a: Rune) {
        myZFunc1(a != r'D')
    }

    func myYFunc1(a: Rune) {
        a
    }
}

enum myEnum<A> {
    B
}

extend<K> myEnum<K> { 
    func myKFunc0(): Int32 {
        -6
    }

}

extend<R> myEnum<R>  { 
    func myRFunc0(a: R) {
        a
    }

}

main(): Unit {
    var myClassImpl = MyClass<Int64>()
    Assert.equals(13, myClassImpl.myYFunc0())
    Assert.equals(132, myClassImpl.myZFunc0())
    Assert.equals(11, myClassImpl.myYFunc1())
    Assert.equals(12, myClassImpl.myZFunc1())

    var myStructImpl = MyStruct<Bool>()
    Assert.equals(r'A', myStructImpl.myZFunc0(true))
    Assert.equals(false, myStructImpl.myZFunc1(true))
    Assert.equals(true, myStructImpl.myYFunc0(r'D'))
    Assert.equals(r'F', myStructImpl.myYFunc1(r'F'))

    var myVar: Int32 = 15
    Assert.equals(15, myEnum<Int32>.B.myRFunc0(myVar))
    Assert.equals(-6, myEnum<Int32>.B.myKFunc0())

}
