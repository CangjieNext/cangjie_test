/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:        14_01_01_a04_01

  @Level:         1

  @Assertion:   14.1.1(4) It has a higher precedence than all other operators.

  @Description: Check that operator $ has a higher precedence than all other operators
  
  @Mode:        run

  @Negative:    no

*/

import utils.assert.Assert
import std.ast.*

class MyClass {
    static func foo(x: Int64) {return 2 * x}
}

main(): Unit {
    var x = 5
    var check01 = quote(2 + $x)
    var check02 = quote(2 + $(x+5))
    var check03 = quote(2 * $x)
    var check04 = quote(2 / $x)
    var check05 = quote(2 % $x)
    var check06 = quote(MyClass.foo(2) + $x)
    var check07 = quote($(MyClass.foo(2) + x))

    Assert.equals("2 + 5", check01.toString())
    Assert.equals("2 + 10", check02.toString())
    Assert.equals("2 * 5", check03.toString())
    Assert.equals("2 / 5", check04.toString())
    Assert.equals("2 % 5", check05.toString())
    Assert.equals("MyClass.foo(2) + 5", check06.toString())
    Assert.equals("9", check07.toString())
}
