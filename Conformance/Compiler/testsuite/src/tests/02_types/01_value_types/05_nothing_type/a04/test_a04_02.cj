/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      02_01_05_a04_02

  @Level:         1

  @Assertion: 2.1.5(4)
              If an expression within a block is of type Nothing, then all subsequent expressions and declarations
              will never be executed.

  @Description: Check that subsequent expressions and declarations are not executed within a block after an expression
                of type Nothing. Check for continue expression.

  @Mode: run

  @Negative: no

  @CompileWarning: Ignore

  @Comment: The only expressions which have Nothing type are: break, continue, return and throw.

*/

import utils.assert.Assert

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

main() {
    var x = 0
    for (v in [1, 2, 3, 4, 5]) {
        if (v == 3) {
            x = 1

            continue

            incGlobal1()
            var g = incGlobal2()
        }
    }

    Assert.equals(1, x)
    Assert.equals(0, global1)
    Assert.equals(0, global2)
}

