/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a56_01

  @Level:         1

  @Assertion: 6.1.2.1(56)
              Calling instance member functions or properties is forbidden in constructors of open classes.

  @Description: Check that correct calling of instance member functions and properties
                is not prohibited in constructors of non-open classes

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

var call_proof = false

open class Parent {
    init() {}

    func f1() {
        return 1
    }

    func f2<T>(x: T) where T <: ToString {
        return "f2: ${x}"
    }

    public func f3() {
        return 2
    }

    public func f4<T>(x: T) where T <: ToString {
        return "f4: ${x}"
    }

    protected func f5() {
        return 3
    }

    protected func f6<T>(x: T) where T <: ToString {
        return "f6: ${x}"
    }

    mut prop p1: Rune {
        get() {
            r'm'
        }
        set(v) {}
    }

    prop p2: Int64 {
        get() {
            5
        }
    }

    public mut prop p3: Rune {
        get() {
            r'u'
        }
        set(v) {}
    }

    public prop p4: Int64 {
        get() {
            6
        }
    }

    protected mut prop p5: Rune {
        get() {
            r'y'
        }
        set(v) {}
    }

    protected prop p6: Int64 {
        get() {
            7
        }
    }
}

class Test <: Parent {
    init() {
        // Check inherited functions
        Assert.equals(1, super.f1())
        Assert.equals("f2: 1", super.f2<Int64>(1))
        Assert.equals(2, super.f3())
        Assert.equals("f4: true", super.f4<Bool>(true))
        Assert.equals(3, super.f5())
        Assert.equals("f6: ()", super.f6<Unit>(()))

        // Check inherited properties
        Assert.equals(r'm', super.p1)
        Assert.equals(5, super.p2)
        Assert.equals(r'u', super.p3)
        Assert.equals(6, super.p4)
        Assert.equals(r'y', super.p5)
        Assert.equals(7, super.p6)

        // Check instance functions
        Assert.equals(9, this.g1())
        Assert.equals("g2: -1", this.g2<Int64>(-1))
        Assert.equals(10, this.g3())
        Assert.equals("g4: l", this.g4<Rune>(r'l'))
        Assert.equals(11, this.g5())
        Assert.equals("g6: [1, 2, 3]", this.g6<Array<Int64>>([1, 2, 3]))
        Assert.equals(12, this.g7())
        Assert.equals("g8: str", this.g8<String>("str"))

        // Check instance properties
        Assert.equals(r'r', this.q1)
        Assert.equals(13, this.q2)
        Assert.equals(r'3', this.q3)
        Assert.equals(14, this.q4)
        Assert.equals(r'<', this.q5)
        Assert.equals(15, this.q6)
        Assert.equals(r'(', this.q7)
        Assert.equals(16, this.q8)

        call_proof = true
    }

    func g1() {
        return 9
    }

    func g2<T>(x: T) where T <: ToString {
        return "g2: ${x}"
    }

    public func g3() {
        return 10
    }

    public func g4<T>(x: T) where T <: ToString {
        return "g4: ${x}"
    }

    protected func g5() {
        return 11
    }

    protected func g6<T>(x: T) where T <: ToString {
        return "g6: ${x}"
    }

    private func g7() {
        return 12
    }

    private func g8<T>(x: T) where T <: ToString {
        return "g8: ${x}"
    }

    mut prop q1: Rune {
        get() {
            r'r'
        }
        set(v) {}
    }

    prop q2: Int64 {
        get() {
            13
        }
    }

    public mut prop q3: Rune {
        get() {
            r'3'
        }
        set(v) {}
    }

    public prop q4: Int64 {
        get() {
            14
        }
    }

    protected mut prop q5: Rune {
        get() {
            r'<'
        }
        set(v) {}
    }

    protected prop q6: Int64 {
        get() {
            15
        }
    }

    private mut prop q7: Rune {
        get() {
            r'('
        }
        set(v) {}
    }

    private prop q8: Int64 {
        get() {
            16
        }
    }
}

main() {
    Test()
    Assert.equals(true, call_proof)
}