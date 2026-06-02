/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a17_01

  @Level:         1

  @Assertion:       8.4(17) When two extensions have different constraints and there is no inclusion relationship 
                    between the two constraints, the two extensions cannot directly use members of each other.

  @Description:     Check that two extensions of one generic type can have different constraints.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

import utils.assert.Assert

class MyClass<X> {}

extend<Y> MyClass<Y>  {
    func myInt32Func(a: Int32) {
        a + 12
    }
}

extend<Z> MyClass<Z> {
    func myCharFunc(a: Rune): String {
        "${a}${a}:${a}"
    }
}

struct MyStruct<T> {}

extend<P> MyStruct<P>{
    func myBoolFunc(a: Bool) {
        !a
    }
}

extend<G> MyStruct<G>  {
    func myStringFunc(a: String): Int64 {
        a.size
    }
}

main(): Unit {
    var myClassInt32Impl = MyClass<Int32>()
    var myClassCharImpl = MyClass<Rune>()

    Assert.equals(24,myClassInt32Impl.myInt32Func(12))
    Assert.equals("BB:B",myClassCharImpl.myCharFunc(r'B'))

    var myStructBoolImpl = MyStruct<Bool>()
    var myStructStringImpl = MyStruct<String>()

    Assert.equals(true,myStructBoolImpl.myBoolFunc(false))
    Assert.equals(4,myStructStringImpl.myStringFunc("wtw4"))
}
