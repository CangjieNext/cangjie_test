/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a02_01

  @Level:         1

  @Assertion: 6.1.4(2)
              A function whose return type is This can only return an expression of type This,
              no other expression is allowed.
              Expressions of type This contain this and calls to other functions that return This.

  @Description: Check that instance members can return expressions of the type This

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006299

*/

import utils.assert.Assert

class Test {
    // Implicitly return this
    func f1(): This {
        this
    }
    // Explicitly return this
    func f2(): This {
        return this
    }
    // Implicitly return the result of the call to a function of This type
    func f3(): This {
        f1()
    }
    // Explicitly return the result of the call to a function of This type
    func f4(): This {
        return f1()
    }

    // Other expressions, declarations and definitions
    // Implicitly return this
    func f5(z: Int64) {
        var x = 1
        func local() {
            x++
        }
        local()
        x *= z
        this
    }
    // Explicitly return this
    func f6(x: Int64): This {
        func local(y: Int64) {
            return y + 1
        }
        var z = x
        z = local(x)
        return this
    }
    // Implicitly return the result of the call to a function of This type
    func f7(s: String): This {
        func local() {
            return "1"
        }
        let b = s + local()
        f1()
    }
    // Explicitly return the result of the call to a function of This type
    func f8(): This {
        var a = 0
        func local() {}
        f1()
        f1()
        local()
        f1()
        return f1()
    }

    // Operators are also functions
    operator func +(rhs: Test): This {
        return this
    }
    operator func -(): This {
        this
    }

    // Implicitly return the result of an operator invocation
    func f9(rhs: Test): This {
        this + rhs
    }

    // Explicitly return the result of an operator invocation
    func f10(): This {
        return -this
    }
}

main() {
    let tst = Test()
    Assert.isTrue(tst.f1() is Test)
    Assert.isTrue(tst.f2() is Test)
    Assert.isTrue(tst.f3() is Test)
    Assert.isTrue(tst.f4() is Test)
    Assert.isTrue(tst.f5(1) is Test)
    Assert.isTrue(tst.f6(2) is Test)
    Assert.isTrue(tst.f7("3") is Test)
    Assert.isTrue(tst.f8() is Test)
    Assert.isTrue(tst.f9(Test()) is Test)
    Assert.isTrue(tst.f10() is Test)
}
