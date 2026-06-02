/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_02_a03_01

  @Level:         1

  @Assertion: 6.2.2.2(3)
              When an interface is inherited or implemented by other interfaces or types,
              the default implementations of the interface are copied into the subtype
              if they have not been reimplemented.

  @Description: Check that a subtype can use default implementations of the superinterface

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

interface I {
    func f1() {
        return 1
    }
    static func f2() {
        return 2
    }
    static func f3<T>() {
        return 3
    }

    mut prop p1: Int64 {
        get() {
            4
        }
        set(v) {}
    }

    prop p2: Int64 {
        get() {
            5
        }
    }

    static mut prop p3: Int64 {
        get() {
            6
        }
        set(v) {}
    }

    static prop p4: Int64 {
        get() {
            7
        }
    }
}

class C1 <: I {
    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
    }
}

struct S1 <: I {
    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
    }
}

enum E1 <: I {
    EC1(String)

    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
    }
}

interface J <: I {}

class C2 <: J {
    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
    }
}

struct S2 <: J {
    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
    }
}

enum E2 <: J {
    EC2(String)

    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Unit>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
    }
}

main() {
    C1().check()
    S1().check()
    E1.EC1("").check()

    C2().check()
    S2().check()
    E2.EC2("").check()
}