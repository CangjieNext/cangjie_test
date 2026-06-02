/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a20_01

  @Level:         1

  @Assertion: 6.1.2.4(20)
              When a static member function is inherited by other subclasses,
              this static member function will not be copied to the subclass

  @Description: Check that inherited static functions invoked from the superclass type
                and from the subclass type return the same value

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006260

  @Comment: The assertion how it is now can not be verified.
            But more than that, this sentence has no relevance to the language.
            Whether static functions are copied or not does not change anything in they behaviour.

*/

import utils.assert.Assert

open class A {
    static func f1() {
        return 1
    }
    static func f2(x: Int64) {
        return x * 2
    }
    static func f3<T>() {
        return z
    }
    static func f4<T>(a: String, b: Rune) {
        return a + f(b)
    }

    private static let z = 11

    static func f(x: Rune) {
        return "${x}${x}"
    }
}

open class B <: A {
    redef static func f(x: Rune) {
        return "${x}${x}${x}"
    }
}

main() {
    Assert.equals(1, A.f1())
    Assert.equals(20, A.f2(10))
    Assert.equals(11, A.f3<Unit>())
    Assert.equals("aaaaaa", A.f4<Unit>("aaaa", r'a'))

    Assert.equals(1, B.f1())
    Assert.equals(20, B.f2(10))
    Assert.equals(11, B.f3<Unit>())
    Assert.equals("aaaaaaa", B.f4<Unit>("aaaa", r'a'))
}