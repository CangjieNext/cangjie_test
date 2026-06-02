/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a30_01

  @Level:         1

  @Assertion: 6.1.2.4(30)
              protected: A function declared with modifier protected
              can only be accessed in this package or in this class and its subclasses.

  @Description: Check that class member functions defined with the 'protected' modifier
                are visible anywhere inside it's package, in their class
                and in a subclass in another package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a30_aux.cj

*/

import utils.assert.Assert

import a30.*

class Local <: Remote {
    protected func g1() {}
    protected func g2(x: Int64) {}
    protected func g3() {
        return 9
    }
    protected func g4(x: Int64) {
        return 10
    }

    protected func g5<T>() {}
    protected func g6<T>(x: Int64) {}
    protected func g7<T>() {
        return 11
    }
    protected func g8<T>(x: Int64) {
        return 12
    }

    protected static func g9() {}
    protected static func g10(x: Int64) {}
    protected static func g11() {
        return 13
    }
    protected static func g12(x: Int64) {
        return 14
    }

    protected static func g13<T>() {}
    protected static func g14<T>(x: Int64) {}
    protected static func g15<T>() {
        return 15
    }
    protected static func g16<T>(x: Int64) {
        return 16
    }

    // Check access in a subclass
    func check_remote() {
        let r = Remote()

        Assert.isTrue(r.f1() is Unit)
        Assert.isTrue(r.f2(2) is Unit)
        Assert.equals(1, r.f3())
        Assert.equals(2, r.f4(1))

        Assert.isTrue(r.f5<Int64>() is Unit)
        Assert.isTrue(r.f6<Rune>(2) is Unit)
        Assert.equals(3, r.f7<Bool>())
        Assert.equals(4, r.f8<Float64>(1))

        Assert.isTrue(Remote.f9() is Unit)
        Assert.isTrue(Remote.f10(2) is Unit)
        Assert.equals(5, Remote.f11())
        Assert.equals(6, Remote.f12(1))

        Assert.isTrue(Remote.f13<Int64>() is Unit)
        Assert.isTrue(Remote.f14<Rune>(2) is Unit)
        Assert.equals(7, Remote.f15<Bool>())
        Assert.equals(8, Remote.f16<Float64>(1))
    }

    // Check access inside the class
    func check_local() {
        let l = Local()
        
        Assert.isTrue(l.g1() is Unit)
        Assert.isTrue(l.g2(2) is Unit)
        Assert.equals(9, l.g3())
        Assert.equals(10, l.g4(1))

        Assert.isTrue(l.g5<Int64>() is Unit)
        Assert.isTrue(l.g6<Rune>(2) is Unit)
        Assert.equals(11, l.g7<Bool>())
        Assert.equals(12, l.g8<Float64>(1))

        Assert.isTrue(Local.g9() is Unit)
        Assert.isTrue(Local.g10(2) is Unit)
        Assert.equals(13, Local.g11())
        Assert.equals(14, Local.g12(1))

        Assert.isTrue(Local.g13<Int64>() is Unit)
        Assert.isTrue(Local.g14<Rune>(2) is Unit)
        Assert.equals(15, Local.g15<Bool>())
        Assert.equals(16, Local.g16<Float64>(1))
    }
}

// Check access in extend from another package
extend Remote {
    func check_extend() {
        Assert.isTrue(f1() is Unit)
        Assert.isTrue(f2(2) is Unit)
        Assert.equals(1, f3())
        Assert.equals(2, f4(1))

        Assert.isTrue(f5<Int64>() is Unit)
        Assert.isTrue(f6<Rune>(2) is Unit)
        Assert.equals(3, f7<Bool>())
        Assert.equals(4, f8<Float64>(1))

        Assert.isTrue(f9() is Unit)
        Assert.isTrue(f10(2) is Unit)
        Assert.equals(5, f11())
        Assert.equals(6, f12(1))

        Assert.isTrue(f13<Int64>() is Unit)
        Assert.isTrue(f14<Rune>(2) is Unit)
        Assert.equals(7, f15<Bool>())
        Assert.equals(8, f16<Float64>(1))
    }
}

main() {
    let r = Remote()
    r.check_extend()

    let l = Local()

    // Check access outside the class in the current package
    Assert.isTrue(l.g1() is Unit)
    Assert.isTrue(l.g2(2) is Unit)
    Assert.equals(9, l.g3())
    Assert.equals(10, l.g4(1))

    Assert.isTrue(l.g5<Int64>() is Unit)
    Assert.isTrue(l.g6<Rune>(2) is Unit)
    Assert.equals(11, l.g7<Bool>())
    Assert.equals(12, l.g8<Float64>(1))

    Assert.isTrue(Local.g9() is Unit)
    Assert.isTrue(Local.g10(2) is Unit)
    Assert.equals(13, Local.g11())
    Assert.equals(14, Local.g12(1))

    Assert.isTrue(Local.g13<Int64>() is Unit)
    Assert.isTrue(Local.g14<Rune>(2) is Unit)
    Assert.equals(15, Local.g15<Bool>())
    Assert.equals(16, Local.g16<Float64>(1))

    l.check_local()
    l.check_remote()
}