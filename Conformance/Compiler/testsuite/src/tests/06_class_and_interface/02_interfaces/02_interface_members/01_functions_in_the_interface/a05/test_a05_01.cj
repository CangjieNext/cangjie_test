/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a05_01

  @Level:         1

  @Assertion: 6.2.2.1(5)
              Functions defined in the interface can be accessed outside the interface,
              with the same effect as public, no access modifiers are allowed.

  @Description: Check that functions in an interface are visible outside the package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a05_aux.cj

*/

import utils.assert.Assert

import a05.*

interface J <: A05Aux {
    func verifySubinterface() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3())
        Assert.equals(4, f4())
    }
}

class A <: A05Aux {
    // Functions without a default implementatin can be overriden
    public override func f3() {
        return 30
    }
    public redef static func f4() {
        return 40
    }

    // Functions without a default implementatin can be called
    func check_class() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        // Check overridde/redefined functions too
        Assert.equals(30, f3())
        Assert.equals(40, f4())
    }
}

struct S <: A05Aux {
    // Functions without a default implementatin can be overriden
    public override func f3() {
        return 300
    }
    public redef static func f4() {
        return 400
    }

    // Functions without a default implementatin can be called
    func check_struct() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        // Check overridde/redefined functions too
        Assert.equals(300, f3())
        Assert.equals(400, f4())
    }
}

enum E <: A05Aux {
    E1(Rune)

    // Functions without a default implementatin can be overriden
    public override func f3() {
        return 3000
    }
    public redef static func f4() {
        return 4000
    }

    // Functions without a default implementatin can be called
    func check_enum() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        // Check overridde/redefined functions too
        Assert.equals(3000, f3())
        Assert.equals(4000, f4())
    }
}

class JImpl <: J {
    public override func f3() {
        return 3
    }

    public redef static func f4() {
        return 4
    }
}

// Check access outside the interface in another package
func check_remote(x: A05Aux) {
    Assert.equals(1, x.f1())
    Assert.equals(2, A05Aux.f2())
    Assert.equals(3, x.f3())

    // Can not call f4 through the type because it's unimplemented in I
}

main() {
    check_remote(JImpl())
    JImpl().verifySubinterface()
    A().check_class()
    S().check_struct()
    E.E1(r'a').check_enum()
}