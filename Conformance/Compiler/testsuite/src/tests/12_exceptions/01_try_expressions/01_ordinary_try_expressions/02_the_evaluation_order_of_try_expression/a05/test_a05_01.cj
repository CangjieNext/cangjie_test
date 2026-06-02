/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      12_01_01_02_a05_01

  @Level:         1

  @Assertion: 12.1.1.2(5) That is, assignment to any variable referenced in the
              expression e above in the finally block will not affect the 
              result v (that has already been evaluated).

  @Description: Checks that finally block will not affect the cached result 
                of return or throw.

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class MyException <: Exception {
    var name = ""
    init(name: String) {
        this.name = name
    }
}

main() {
    // test case #1: checks return in try
    func foo1() {
        var v : Float64 = -1.0
        try {
            return v / 10.0
        } finally {
            v = 0.0
        }
    }
    Assert.approxEquals(-0.1, foo1())

    // test case #2: checks return in catch
    func foo2() {
        var v : Int64 = 15
        try {
            throw Exception()
        } catch (_) {
            return v
        } finally {
            v = -1
        }
    }
    Assert.equals(15, foo2())

    // test case #3: checks throw in try
    var e3 = MyException("Was in try")
    try {
        try {
            throw e3
        } finally {
            e3 = MyException("Was in finally")
        }
    } catch (e: MyException) {
        Assert.equals("Was in try", e.name)
    }

    // test case #4: checks throw in try
    var e4 = MyException("Was in catch")
    try {
        try {
            throw MyException("Was in try")
        } catch (_) {
            throw e4
        } finally {
            e4 = MyException("Was in finally")
        }
    } catch (e: MyException) {
        Assert.equals("Was in catch", e.name)
    }

    return
}
