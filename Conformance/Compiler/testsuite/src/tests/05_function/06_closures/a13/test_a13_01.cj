/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a13_01

  @Level:         1

  @Assertion: 5.6(13) Therefore, a function or lambda that accesses a global variable, static member variable, 
              instance member variable modified by var can still be used as a first-class citizen.

  @Description: Check that closure which accesses a global variable, static member variable and instace member variable
                modified by var can be used as a first-class citizen, i.e. can be assigned to a variable, can be passed
                as function argument, can be a return value, can be used as an expression.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func callMe(fn: () -> Int64) {
    fn()
}

//
// Case: function closure that accesses a global variable.
//

var global = 3

func test1() {

    func foo() {
        global * 2
    }

    // Assignment to a variable.
    let g = foo
    Assert.equals(6, g())

    // Usage as an expression.
    foo

    // Usage as an argument.
    var x = callMe(foo)
    Assert.equals(6, x)

    // Usage as a return value.
    return foo
}

//
// Case: lambda closure that accesses a global variable.
//

func test2() {
    // Assignment to a variable.
    let g = { => global * 2 }
    Assert.equals(6, g())

    // Usage as an expression.
    { => global * 2 }

    // Usage as an argument.
    var x = callMe({ => global * 2 })
    Assert.equals(6, x)

    // Usage as a return value.
    return { => global * 2}
}

class C {
    static var s = 3

    var m = 3

    //
    // Case: function closure that accesses static instance member.
    //
    func test3() {
        func foo() {
            s * 2
        }

        // Assignment to a variable.
        let g = foo
        Assert.equals(6, g())

        // Usage as an expression.
        g

        // Usage as an argument.
        var x = callMe(foo)
        Assert.equals(6, x)

        // Usage as a return value.
        return foo
    }

    //
    // Case: lambda closure that accesses static instance member.
    //
    func test4() {
        // Assignment to a variable.
        let g = { => s * 2 }

        // Usage as an expression.
        { => s * 2 }

        // Usage as an argument.
        var x = callMe({ => s * 2 })
        Assert.equals(6, x)

        // Usage as a return value.
        return { => s * 2 }
    }

    //
    // Case: function closure that accesses instance member variable.
    //
    func test5() {
        func foo() {
            m * 2
        }

        // Assignment to a variable.
        let g = foo
        Assert.equals(6, g())

        // Usage as an expression.
        foo

        // Usage as an argument.
        var x = callMe(foo)
        Assert.equals(6, x)

        // Usage as a return value.
        return foo
    }

    //
    // Case: lambda closure that accesses instance member variable.
    //
    func test6() {
        // Assignment to a variable.
        let g = { => m * 2 }

        // Usage as an expression.
        { => m * 2 }

        // Usage as an argument.
        var x = callMe({ => m * 2 })
        Assert.equals(6, x)

        // Usage as a return value.
        return { => m * 2 }
    }
}

main() {
    Assert.equals(6, test1()())
    Assert.equals(6, test2()())
    Assert.equals(6, C().test3()())
    Assert.equals(6, C().test4()())
    Assert.equals(6, C().test5()())
    Assert.equals(6, C().test6()())
}

