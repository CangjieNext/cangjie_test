/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_03_a01_01

  @Level:         1

  @Assertion: 6.3.3(1)
              During inheritance, a member of a subtype must not shadow a member of the supertype.
              If the shadowing occurs, an error will be compiled.

  @Description: Check that private members of the superclass can be shadowed
                since they do not participate in inheritance
  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006441, 0006124

*/

import utils.assert.Assert

open class A {
    private let a = 1
    private var b = 2
    static private let c = 3
    static private var d = 4
    private func f1() {
        return 5
    }
    static private func f2() {
        return 6
    }
    private mut prop p1: Int64 {
        get() {
            7
        }
        set(v) {}
    }
    private prop p2: Int64 {
        get() {
            8
        }
    }
    static private mut prop p3: Int64 {
        get() {
            9
        }
        set(v) {}
    }
    static private prop p4: Int64 {
        get() {
            10
        }
    }

    func check_super() {
        Assert.equals(1, a)
        Assert.equals(2, b)
        Assert.equals(3, c)
        Assert.equals(4, d)
        Assert.equals(5, f1())
        Assert.equals(6, f2())
        Assert.equals(7, p1)
        Assert.equals(8, p2)
        Assert.equals(9, p3)
        Assert.equals(10, p4)
    }
}

class B <: A {
    let a = 11
    let b = 12
    let c = 13
    let d = 14
    let f1 = 15
    let f2 = 16
    let p1 = 17
    let p2 = 18
    let p3 = 19
    let p4 = 20

    func check_sub() {
        Assert.equals(11, a)
        Assert.equals(12, b)
        Assert.equals(13, c)
        Assert.equals(14, d)
        Assert.equals(15, f1)
        Assert.equals(16, f2)
        Assert.equals(17, p1)
        Assert.equals(18, p2)
        Assert.equals(19, p3)
        Assert.equals(20, p4)
    }
}

main() {
    B().check_super()
    B().check_sub()
}