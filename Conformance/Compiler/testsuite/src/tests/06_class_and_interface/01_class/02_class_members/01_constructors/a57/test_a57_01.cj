/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a57_01

  @Level:         1

  @Assertion: 6.1.2.1(57)
              this variable can not escape out of constructors of open classes.

  @Description: Check that this can escape out of constructors of non-open classes
                when used after initialization of all member variables

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006124

*/

import utils.assert.Assert

var this_lambda_escape: () -> Test = { => Test(1) }
var mem_lambda_escape: () -> Int64 = { => 1 }
var func_lambda_escape: () -> Int64 = { => 1 }
var prop_lambda_escape: () -> Int64 = { => 1 }

var this_func_escape: () -> Test = { => Test(1) }
var mem_func_escape: () -> Int64 = { => 1 }
var func_func_escape: () -> Int64 = { => 1 }
var prop_func_escape: () -> Int64 = { => 1 }

var just_this = Test(1)
var some_func = { => 1 }

func accepts_this(x: Test) {
    Assert.equals(13, x.w)
}

class Test {
    init() {
        w = 13

        this_lambda_escape = { => this }
        mem_lambda_escape = { => this.v }
        func_lambda_escape = { => this.f() }
        prop_lambda_escape = { => this.p }

        func f1() {
            return this
        }

        func f2() {
            return this.v
        }

        func f3() {
            return this.f()
        }

        func f4() {
            return this.p
        }

        this_func_escape = f1
        mem_func_escape = f2
        func_func_escape = f3
        prop_func_escape = f4

        just_this = this
        some_func = f
        accepts_this(this)
    }

    init(x: Int64) {
        w = 0
    }

    let v = 12
    let w: Int64

    func f() {
        return 25
    }

    prop p: Int64 {
        get() {
            100
        }
    }
}

main() {
    let tst = Test()
    Assert.equals(12, mem_lambda_escape())
    Assert.equals(25, func_lambda_escape())
    Assert.equals(100, prop_lambda_escape())
    Assert.isTrue(this_lambda_escape() is Test)
    Assert.equals(13, this_lambda_escape().w)

    Assert.equals(12, mem_func_escape())
    Assert.equals(25, func_func_escape())
    Assert.equals(100, prop_func_escape())
    Assert.isTrue(this_func_escape() is Test)
    Assert.equals(13, this_func_escape().w)

    Assert.equals(25, some_func())
    Assert.isTrue(just_this is Test)
    Assert.equals(13, just_this.w)
}