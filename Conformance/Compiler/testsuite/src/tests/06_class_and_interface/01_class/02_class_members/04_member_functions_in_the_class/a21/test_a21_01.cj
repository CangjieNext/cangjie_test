/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a21_01

  @Level:         1

  @Assertion: 6.1.2.4(21)
              Static member functions in both abstract
              and non-abstract classes must have implementations.

  @Description: Check that static member functions can apper in all types of classes

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

abstract class Abstract {
    static func f1() {
        return 1
    }
    static func f2<T>() {
        return 2
    }
    static func f3(p: Int64) {
        return 3
    }
    static func f4<T>(p: T) {
        return 4
    }
    static func f5() {}
    static func f6<T, U>() {}
    static func f7(x: Bool, y: Rune) {}
    static func f8<T>(x: T, y: T) {}
}

open class Open {
    static func f1() {
        return 5
    }
    static func f2<T>() {
        return 6
    }
    static func f3(p: Int64) {
        return 7
    }
    static func f4<T>(p: T) {
        return 8
    }
    static func f5() {}
    static func f6<T, U>() {}
    static func f7(x: Bool, y: Rune) {}
    static func f8<T>(x: T, y: T) {}
}

sealed abstract class Sealed {
    static func f1() {
        return 9
    }
    static func f2<T>() {
        return 10
    }
    static func f3(p: Int64) {
        return 11
    }
    static func f4<T>(p: T) {
        return 12
    }
    static func f5() {}
    static func f6<T, U>() {}
    static func f7(x: Bool, y: Rune) {}
    static func f8<T>(x: T, y: T) {}
}

class Regular {
    static func f1() {
        return 13
    }
    static func f2<T>() {
        return 14
    }
    static func f3(p: Int64) {
        return 15
    }
    static func f4<T>(p: T) {
        return 16
    }
    static func f5() {}
    static func f6<T, U>() {}
    static func f7(x: Bool, y: Rune) {}
    static func f8<T>(x: T, y: T) {}
}

main() {
    Assert.equals(1, Abstract.f1())
    Assert.equals(2, Abstract.f2<Bool>())
    Assert.equals(3, Abstract.f3(90))
    Assert.equals(4, Abstract.f4<Float64>(0.1))
    Assert.isTrue(Abstract.f5() is Unit)
    Assert.isTrue(Abstract.f6<Rune, Int64>() is Unit)
    Assert.isTrue(Abstract.f7(false, r'c') is Unit)
    Assert.isTrue(Abstract.f8<Unit>((), ()) is Unit)

    Assert.equals(5, Open.f1())
    Assert.equals(6, Open.f2<UInt8>())
    Assert.equals(7, Open.f3(90))
    Assert.equals(8, Open.f4<String>("ccccc"))
    Assert.isTrue(Open.f5() is Unit)
    Assert.isTrue(Open.f6<Bool, Bool>() is Unit)
    Assert.isTrue(Open.f7(false, r'c') is Unit)
    Assert.isTrue(Open.f8<(Bool, Bool)>((true, true), (false, true)) is Unit)

    Assert.equals(9, Sealed.f1())
    Assert.equals(10, Sealed.f2<Int8>())
    Assert.equals(11, Sealed.f3(90))
    Assert.equals(12, Sealed.f4<Array<Rune>>([r'f', r'f']))
    Assert.isTrue(Sealed.f5() is Unit)
    Assert.isTrue(Sealed.f6<Any, Any>() is Unit)
    Assert.isTrue(Sealed.f7(false, r'c') is Unit)
    Assert.isTrue(Sealed.f8<String>("", "") is Unit)

    Assert.equals(13, Regular.f1())
    Assert.equals(14, Regular.f2<Unit>())
    Assert.equals(15, Regular.f3(90))
    Assert.equals(16, Regular.f4<Range<Int64>>(1..2:1))
    Assert.isTrue(Regular.f5() is Unit)
    Assert.isTrue(Regular.f6<Bool, Bool>() is Unit)
    Assert.isTrue(Regular.f7(false, r'c') is Unit)
    Assert.isTrue(Regular.f8<Rune>(r'b', r'r') is Unit)
}