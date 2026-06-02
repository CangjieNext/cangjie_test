/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a06_01

  @Level:         1

  @Assertion: 6.1.2.4(6)
              instance member functions can be categorized into abstract member functions
              and non-abstract member functions.

  @Description: Check that instance functions in the class can be abstract or non-abstract

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

abstract class Test {
    public      func a1(): Unit
    protected   func a2(x: Int64): Int64
    open public func a3(x: Bool, y: String): Int64
    protected   func a4(): Int64
    public      func a5(x!: String): Int64

    protected   func f1() {}
    public open func f2(): Int64 {
        return 1
    }
    public      func f3(x: Int64) {
        return 2
    }
    private     func f4<T>(x!: T) {
        return 3
    }
    func f5(a: Bool, b: Rune) {
        return 4
    }

    func test() {
        Assert.equals(1, f2())
        Assert.equals(2, f3(10))
        Assert.equals(3, f4<String>(x: "12"))
        Assert.equals(4, f5(false, r'1'))

        Assert.equals(5, a2(1))
        Assert.equals(6, a3(true, "true"))
        Assert.equals(7, a4())
        Assert.equals(8, a5(x: "A"))

        Assert.isTrue(f1() is Unit)
        Assert.isTrue(a1() is Unit)
    } 
}

class Child <: Test {
    public      func a1() {}
    protected   func a2(x: Int64) {
        return 5
    }
    public func a3(x: Bool, y: String) {
        return 6
    }
    protected   func a4() {
        return 7
    }
    public      func a5(x!: String) {
        return 8
    }
}

main() {
    Child().test()
}