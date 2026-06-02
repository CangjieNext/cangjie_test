/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a08_01

  @Level:         1

  @Comment: This assertion is a part of the list with the following heading:
            Variables in class can be declared with the following modifiers.

  @Assertion: 6.1.2.3(8)
              private: A variable declared with modifier private can only be accessed in this class.

  @Description: Check that member variables declared with the modifier 'private'
                are visible inside their class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006136

*/

import utils.assert.Assert

class A {
    private let m1 = 1
    private var m2 = 2

    static private let s1 = 10
    static private var s2 = 20

    // Private static variables are visible in the static initializer
    static init() {
        Assert.equals(10, A.s1)
        Assert.equals(20, A.s2)

        A.s2 = 11
        Assert.equals(11, A.s2)
        A.s2 = 20
    }

    // Private variables are visible in constructors
    init() {
        Assert.equals(1, this.m1)
        Assert.equals(2, this.m2)

        Assert.equals(10, A.s1)
        Assert.equals(20, A.s2)

        this.m2 = 20
        Assert.equals(20, this.m2)
        this.m2 = 2

        A.s2 = 11
        Assert.equals(11, A.s2)
        A.s2 = 20
    }

    // Private variables are visible in instance functions
    func test_instance() {
        Assert.equals(1, this.m1)
        Assert.equals(2, this.m2)

        Assert.equals(10, A.s1)
        Assert.equals(20, A.s2)

        this.m2 = m1
        Assert.equals(1, this.m2)
        this.m2 = 2

        A.s2 = m2
        Assert.equals(2, A.s2)
        A.s2 = 20
    }

    // Private variables are visible in static functions
    static func test_static() {
        let a = A()
        Assert.equals(1, a.m1)
        Assert.equals(2, a.m2)

        Assert.equals(10, A.s1)
        Assert.equals(20, A.s2)

        a.m2 = 99
        Assert.equals(99, a.m2)

        A.s2 = 35 * 2
        Assert.equals(70, A.s2)
        A.s2 = 20
    }

    // Private variables are visible in instance properties
    mut prop p1: Int64 {
        get() {
            Assert.equals(1, this.m1)
            Assert.equals(2, this.m2)

            Assert.equals(10, A.s1)
            Assert.equals(20, A.s2)

            this.m2 = 0
            Assert.equals(0, this.m2)
            this.m2 = 2

            A.s2 = 0
            Assert.equals(0, A.s2)
            A.s2 = 20

            1
        }
        set(v) {
            Assert.equals(1, this.m1)
            Assert.equals(2, this.m2)

            Assert.equals(10, A.s1)
            Assert.equals(20, A.s2)

            this.m2 = 0
            Assert.equals(0, this.m2)
            this.m2 = 2

            A.s2 = 0
            Assert.equals(0, A.s2)
            A.s2 = 20
        }
    }

    // Private variables are visible in static properties
    static mut prop p2: Int64 {
        get() {
            let a = A()

            Assert.equals(1, a.m1)
            Assert.equals(2, a.m2)

            Assert.equals(10, A.s1)
            Assert.equals(20, A.s2)

            a.m2 = 0
            Assert.equals(0, a.m2)

            A.s2 = 0
            Assert.equals(0, A.s2)
            A.s2 = 20

            1
        }
        set(v) {
            let a = A()

            Assert.equals(1, a.m1)
            Assert.equals(2, a.m2)

            Assert.equals(10, A.s1)
            Assert.equals(20, A.s2)

            a.m2 = 0
            Assert.equals(0, a.m2)

            A.s2 = 0
            Assert.equals(0, A.s2)
            A.s2 = 20
        }
    }

    // Private variables are visible in finalizers
    // This is not going to be called, so just check correct compilation
    ~init() {
        let a = A()
        Assert.equals(1, a.m1)
        Assert.equals(2, a.m2)

        Assert.equals(10, A.s1)
        Assert.equals(20, A.s2)

        a.m2 = 0
        Assert.equals(0, a.m2)

        A.s2 = 0
        Assert.equals(0, A.s2)
        A.s2 = 20
    }
}

main() {
    let a = A()
    a.test_instance()
    A.test_static()

    let x = a.p1
    a.p1 = 2

    let y = A.p2
    A.p2 = 2
}