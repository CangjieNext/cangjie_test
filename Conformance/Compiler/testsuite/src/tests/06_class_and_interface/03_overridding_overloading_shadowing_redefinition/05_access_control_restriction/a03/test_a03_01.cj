/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_05_a03_01

  @Level:         1

  @Assertion: 6.3.5(3)
              When a type implements interface, the access level of the function
              which implements abstarct function cannot be changed
              to be lower than the abstract function in the super type.

  @Description: Check that a subtype can implement a function from an interface
                if the access level remains public

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface I {
    func f1(): Int64
    static func f2(): Int64
    static func f3<T>(): Int64
    func f4() {
        return 0
    }
    static func f5() {
        return 0
    }
    static func f6<T>() {
        return 0
    }
}

class C <: I {
    public override func f1() {
        return 1
    }
    public redef static func f2() {
        return 2
    }
    public redef static func f3<T>() {
        return 3
    }
    public override func f4() {
        return 4
    }
    public redef static func f5() {
        return 5
    }
    public redef static func f6<T>() {
        return 6
    }
}

struct S <: I {
    public override func f1() {
        return 11
    }
    public redef static func f2() {
        return 12
    }
    public redef static func f3<T>() {
        return 13
    }
    public override func f4() {
        return 14
    }
    public redef static func f5() {
        return 15
    }
    public redef static func f6<T>() {
        return 16
    }
}

enum E <: I {
    E1
    public override func f1() {
        return 21
    }
    public redef static func f2() {
        return 22
    }
    public redef static func f3<T>() {
        return 23
    }
    public override func f4() {
        return 24
    }
    public redef static func f5() {
        return 25
    }
    public redef static func f6<T>() {
        return 26
    }
}

main() {
    Assert.equals(1, C().f1())
    Assert.equals(2, C.f2())
    Assert.equals(3, C.f3<Unit>())
    Assert.equals(4, C().f4())
    Assert.equals(5, C.f5())
    Assert.equals(6, C.f6<Unit>())

    Assert.equals(11, S().f1())
    Assert.equals(12, S.f2())
    Assert.equals(13, S.f3<Unit>())
    Assert.equals(14, S().f4())
    Assert.equals(15, S.f5())
    Assert.equals(16, S.f6<Unit>())

    Assert.equals(21, E.E1.f1())
    Assert.equals(22, E.f2())
    Assert.equals(23, E.f3<Unit>())
    Assert.equals(24, E.E1.f4())
    Assert.equals(25, E.f5())
    Assert.equals(26, E.f6<Unit>())
}