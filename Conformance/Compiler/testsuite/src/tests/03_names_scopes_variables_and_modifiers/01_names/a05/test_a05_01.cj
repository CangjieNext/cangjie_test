/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_01_a05_01

  @Level:         1

  @Assertion:    3.1(5) If their scopes overlap, the name of the lower-level scope shadows the name
                       of the higher-level scope.

  @Description:  Сheck that If their scopes overlap, the lower level scope name obscures the higher
                 level scope name.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.*

class C {}

func f() {
    let x = 2
    return x
}

enum E { a | b}

struct S <: ToString {
    public func toString() { return "S" }
    static let x = 0.0256
}

main() {
    // Check lambda scope
    var x: Int64 = 5
    Assert.equals("x=${x}", "x=5")

    { =>
        let x = 0xb6
        Assert.equals(x, 0xb6)
    }()

    { =>
        let utils = 2
        let C = .536
        var f = r's'
        var e = { => print("'") }
        var s = true
        Assert.equals(2, utils)
        Assert.isTrue(utils is Int64)
        Assert.equals(.536, C)
        Assert.isTrue(C is Float64)
        Assert.equals(r's', f)
        Assert.isTrue(f is Rune)
        Assert.isTrue(e is ()->Unit)
        Assert.equals(true, s)
        Assert.isTrue(s is Bool )
    }()

    // Check function scope
    Assert.equals(5, x)
    Assert.isTrue(C() is C)
    Assert.isTrue(f is ()->Int64)
    Assert.isTrue(E.a is E)
    Assert.equals("S", "${S()}")

    let utils = 2
    let C = .536
    var f = r's'
    var e = { => print("'") }
    var s = true

    Assert.equals(2, utils)
    Assert.isTrue(utils is Int64)
    Assert.equals(.536, C)
    Assert.isTrue(C is Float64)
    Assert.equals(r's', f)
    Assert.isTrue(f is Rune)
    Assert.isTrue(e is ()->Unit)
    Assert.equals(true, s)
    Assert.isTrue(s is Bool )
}