/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_01_a01_02

  @Level:         1

  @Assertion: 6.2.3.1(1)
              If a subinterface inherits a function or property
              that does not have a default implementation in the superinterface,
              only the declaration of this function or property is allowed in the subinterface
              (and of course give a default implementation is allowed) ,
              and the override or redef modifier preceding the function declaration or definition is optional.

  @Description: Check that an interface can use 'redef' and 'override' modifiers
                when redeclaring or implementing abstract members of the superinterface

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124, 0006370, 0006369

*/

import utils.assert.Assert

interface I {
    func f1(): Int64
    static func f2(): Int64
    static func f3<T>(): Int64

    mut prop p1: Int64
    prop p2: Int64
    static mut prop p3: Int64
    static prop p4: Int64

    operator func -(): Int64
}

interface J <: I {
    override func f1(): Int64
    redef static func f2(): Int64
    redef static func f3<T>(): Int64

    override mut prop p1: Int64
    override prop p2: Int64
    redef static mut prop p3: Int64
    redef static prop p4: Int64

    override operator func -(): Int64
}

interface K <: J {
    override func f1() {
        return 1
    }
    redef static func f2() {
        return 2
    }
    redef static func f3<T>() {
        return 3
    }

    override mut prop p1: Int64 {
        get() {
            4
        }
        set(v) {}
    }
    override prop p2: Int64 {
        get() {
            5
        }
    }
    redef static mut prop p3: Int64 {
        get() {
            6
        }
        set(v) {}
    }
    redef static prop p4: Int64 {
        get() {
            7
        }
    }

    override operator func -() {
        return 8
    }

    func verify() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<Bool>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
        Assert.equals(8, -this)
    }
}

class Impl <: K {}

main() {
    Impl().verify()
}