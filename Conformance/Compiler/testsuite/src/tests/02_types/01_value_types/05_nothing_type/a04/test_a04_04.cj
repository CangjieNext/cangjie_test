/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      02_01_05_a04_04

  @Level:         1

  @Assertion: 2.1.5(4)
              If an expression within a block is of type Nothing, then all subsequent expressions and declarations
              will never be executed.

  @Description: Check that subsequent expressions and declarations are not executed within a block after an expression
                of type Nothing. Check for throw expression.

  @Mode: run

  @Negative: no

  @CompileWarning: Ignore

  @Comment: The only expressions which have Nothing type are: break, continue, return and throw.

*/

import utils.assert.Assert

var global0 = 0
var global1 = 0
var global2 = 0

func incGlobal1() {
    global1++
    global1
}

func incGlobal2() {
    global2++
    global2
}

func test() {
    global0 = 0
    try {
        throw Exception("nobody expects the spanish inquisition!")

        global0 = 2

        incGlobal1()
        var g = incGlobal2()
    } catch (e: Exception) {
        global0 = 1
    }
}

main() {
    test()
    Assert.equals(1, global0)
    Assert.equals(0, global1)
    Assert.equals(0, global2)
}

