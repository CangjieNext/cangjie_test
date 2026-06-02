/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a11_03

  @Level:         1

  @Assertion: 6.2.4.1(11)
              The override modifier (or redef modifier) before the definition
              of a function or property is optional when implementing an interface for a type,
              regardless of whether there is a default implementation of the function or property in the interface.

  @Description: Check that a struct can optionally use 'override' and 'redef' modifiers
                when implementing interface members without default implementations

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

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

    operator func[](idx: Int64): Int64
}

struct C1 <: I {
    public func f1() {
        return 1
    }
    public static func f2() {
        return 2
    }
    public static func f3<T>() {
        return 3
    }

    public mut prop p1: Int64 {
        get() {
            4
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            5
        }
    }
    public static mut prop p3: Int64 {
        get() {
            6
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            7
        }
    }

    public operator func[](idx: Int64) {
        return 8
    }

    func test() {
        Assert.equals(1, f1())
        Assert.equals(2, f2())
        Assert.equals(3, f3<String>())
        Assert.equals(4, p1)
        Assert.equals(5, p2)
        Assert.equals(6, p3)
        Assert.equals(7, p4)
        Assert.equals(8, this[10])
    }
}

struct C2 <: I {
    public override func f1() {
        return 11
    }
    public redef static func f2() {
        return 12
    }
    public redef static func f3<T>() {
        return 13
    }

    public override mut prop p1: Int64 {
        get() {
            14
        }
        set(v) {}
    }
    public override prop p2: Int64 {
        get() {
            15
        }
    }
    public redef static mut prop p3: Int64 {
        get() {
            16
        }
        set(v) {}
    }
    public redef static prop p4: Int64 {
        get() {
            17
        }
    }

    public override operator func[](idx: Int64) {
        return 18
    }

    func test() {
        Assert.equals(11, f1())
        Assert.equals(12, f2())
        Assert.equals(13, f3<String>())
        Assert.equals(14, p1)
        Assert.equals(15, p2)
        Assert.equals(16, p3)
        Assert.equals(17, p4)
        Assert.equals(18, this[10])
    }
}

main() {
    C1().test()
    C2().test()
}