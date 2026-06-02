/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_01_01_a09_01

  @Level:         1

  @Assertion: 6.3.1.1(9)
              Functions modified with private in a class are not inherited and cannot be accessed in subclasses.

  @Description: Check that a subclass can define the same function as the private function in the superclass
                if it's not an overriding function

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

  @Comment: this assertion is in the context of function overriding in a class

*/

import utils.assert.Assert

abstract class A {
    private func f() {
        return 1
    }

    func check(x: A, y: C1) {
        // Both objects have a runtime type C1,
        // but since there's no overriding,
        // the function is chosen based on the compile-time type
        Assert.equals(1, x.f())
        Assert.equals(2, y.f())
    }
}

class C1 <: A {
    func f() {
        return 2
    }
}

open class B {
    private func f(a: Rune, b: String) {
        return 1
    }

    func check(x: B, y: C2) {
        // Both objects have a runtime type C2,
        // but since there's no overriding,
        // the function is chosen based on the compile-time type
        Assert.equals(1, x.f(r'a', ""))
        Assert.equals(2, y.f(r'a', ""))
    }
}

class C2 <: B {
    func f(a: Rune, b: String) {
        return 2
    }
}

sealed abstract class C<T> {
    private func f(x: T) {
        return 1
    }

    func check(x: C<Bool>, y: C3<Bool>) {
        // Both objects have a runtime type C3,
        // but since there's no overriding,
        // the function is chosen based on the compile-time type
        Assert.equals(1, x.f(false))
        Assert.equals(2, y.f(false))
    }
}

class C3<T> <: C<T> {
    func f(x: T) {
        return 2
    }
}

main() {
    C1().check(C1(), C1())
    C2().check(C2(), C2())
    C3<Bool>().check(C3<Bool>(), C3<Bool>())
}