/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a10_01

  @Level:         1

  @Assertion: 6.1.2.3(10)
              Private variables cannot be accessed outside of a class through a class instance
              and cannot be inherited.

  @Description: Check that private variables are visible inside their class

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006236, 0006136

*/

import utils.assert.Assert

class Test {
    private var a = "aaa"
    private let b = false
    private var c: Int64
    private let d: Rune

    static private var e = (1, 11)
    static private let f = [1, 1]
    static private var g: () -> Int64
    static private let h: Range<Int64>

    init() {
        c = 90
        d = r'm'
    }

    static init() {
        g = { => 100 }
        h = -1..20:3
    }

    func test() {
        let obj = Test()
        Assert.equals("aaa", obj.a)
        Assert.equals(false, obj.b)
        Assert.equals(90, obj.c)
        Assert.equals(r'm', obj.d)

        Assert.equals(1, Test.e[0])
        Assert.equals(11, Test.e[1])
        Assert.equals([1, 1], Test.f)
        Assert.equals(100, Test.g())
        Assert.equals(-1..20:3, Test.h)
    }
}

main() {
    Test().test()
}