/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a11_04

  @Level:         1

  @Assertion: 6.2.4.1(11)
              The override modifier (or redef modifier) before the definition
              of a function or property is optional when implementing an interface for a type,
              regardless of whether there is a default implementation of the function or property in the interface.

  @Description: Check that a struct can optionally use 'override' and 'redef' modifiers
                when implementing interface members with default implementations

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

    operator func[](idx: Int64) {
        return 8
    }
}

struct C1 <: I {
    public func f1() {
        return 11
    }
    public static func f2() {
        return 12
    }
    public static func f3<T>() {
        return 13
    }

    public mut prop p1: Int64 {
        get() {
            14
        }
        set(v) {}
    }
    public prop p2: Int64 {
        get() {
            15
        }
    }
    public static mut prop p3: Int64 {
        get() {
            16
        }
        set(v) {}
    }
    public static prop p4: Int64 {
        get() {
            17
        }
    }

    public operator func[](idx: Int64) {
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

struct C2 <: I {
    public override func f1() {
        return 21
    }
    public redef static func f2() {
        return 22
    }
    public redef static func f3<T>() {
        return 23
    }

    public override mut prop p1: Int64 {
        get() {
            24
        }
        set(v) {}
    }
    public override prop p2: Int64 {
        get() {
            25
        }
    }
    public redef static mut prop p3: Int64 {
        get() {
            26
        }
        set(v) {}
    }
    public redef static prop p4: Int64 {
        get() {
            27
        }
    }

    public override operator func[](idx: Int64) {
        return 28
    }

    func test() {
        Assert.equals(21, f1())
        Assert.equals(22, f2())
        Assert.equals(23, f3<String>())
        Assert.equals(24, p1)
        Assert.equals(25, p2)
        Assert.equals(26, p3)
        Assert.equals(27, p4)
        Assert.equals(28, this[10])
    }
}

main() {
    C1().test()
    C2().test()
}