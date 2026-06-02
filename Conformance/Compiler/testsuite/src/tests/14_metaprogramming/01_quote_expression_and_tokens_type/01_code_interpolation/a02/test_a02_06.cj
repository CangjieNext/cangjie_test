/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a02_06

  @Level:         1

  @Assertion:   14.1.1(2) The operator is followed by an expression, indicating that the
                value of the expression is converted to tokens.

  @Description: Check that value of postfix expressions is converted to a token
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*
import std.convert.*

public class TestA0206 {
    private let PI = 3.1415
    public var value = 27 
}

struct MyStruct {
    public let PI = 3.1415
}

func foo(name! :String = "Anon") {
    return "Hello, " + name
}

main(): Unit {
    // Member Access Expressions
    var cls = TestA0206()
    let strct = MyStruct()

    var ci_val = quote($(cls.value))
    var ci_pi = quote($(strct.PI))

    Assert.equals(cls.value.toString(), ci_val.toString())
    Assert.equals(strct.PI.format('1.4'), ci_pi.toString())
    Assert.isTrue(ci_val is Tokens)
    Assert.isTrue(ci_pi is Tokens)

    // Function Invocation Expressions
    var ci_foo_0 = quote($(foo()))
    let ci_foo_1 = quote($(foo(name: "Jimmy")))

    Assert.equals('"Hello, Anon"', ci_foo_0.toString())
    Assert.equals('"Hello, Jimmy"', ci_foo_1.toString())
    Assert.isTrue(ci_foo_0 is Tokens)
    Assert.isTrue(ci_foo_1 is Tokens)

    // Index Access Expressions
    var arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var item = 8
    var ci_arr_0 = quote($(arr[5]))
    var ci_arr_1 = quote($(arr[item]))

    Assert.equals(arr[5].toString(), ci_arr_0.toString())
    Assert.equals(arr[item].toString(), ci_arr_1.toString())
    Assert.isTrue(ci_arr_0 is Tokens)
    Assert.isTrue(ci_arr_1 is Tokens)
}
