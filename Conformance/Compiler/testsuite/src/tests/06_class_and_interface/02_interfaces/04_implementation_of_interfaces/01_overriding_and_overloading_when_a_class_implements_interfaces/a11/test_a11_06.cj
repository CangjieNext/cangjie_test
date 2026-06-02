/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a11_06

  @Level:         1

  @Assertion: 6.2.4.1(11)
              The override modifier (or redef modifier) before the definition
              of a function or property is optional when implementing an interface for a type,
              regardless of whether there is a default implementation of the function or property in the interface.

  @Description: Check that an enum can optionally use 'override' and 'redef' modifiers
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

    prop p1: Int64 {
        get() {
            4
        }
    }
    static prop p2: Int64 {
        get() {
            5
        }
    }

    operator func[](idx: Int64) {
        return 6
    }
}

enum C1 <: I {
    E1
    public func f1() {
        return 11
    }
    public static func f2() {
        return 12
    }
    public static func f3<T>() {
        return 13
    }

    public prop p1: Int64 {
        get() {
            14
        }
    }
    public static prop p2: Int64 {
        get() {
            15
        }
    }

    public operator func[](idx: Int64) {
        return 16
    }

    func test() {
        Assert.equals(11, f1())
        Assert.equals(12, f2())
        Assert.equals(13, f3<String>())
        Assert.equals(14, p1)
        Assert.equals(15, p2)
        Assert.equals(16, this[10])
    }
}

enum C2 <: I {
    E2
    public override func f1() {
        return 21
    }
    public redef static func f2() {
        return 22
    }
    public redef static func f3<T>() {
        return 23
    }

    public override prop p1: Int64 {
        get() {
            24
        }
    }
    public redef static prop p2: Int64 {
        get() {
            25
        }
    }

    public override operator func[](idx: Int64) {
        return 26
    }

    func test() {
        Assert.equals(21, f1())
        Assert.equals(22, f2())
        Assert.equals(23, f3<String>())
        Assert.equals(24, p1)
        Assert.equals(25, p2)
        Assert.equals(26, this[10])
    }
}

main() {
    C1.E1.test()
    C2.E2.test()
}