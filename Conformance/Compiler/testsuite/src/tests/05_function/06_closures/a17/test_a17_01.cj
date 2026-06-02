/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a17_01

  @Level:         1

  @Assertion: 5.6(17) The following rules must be met for captured variables: 

              * If there is a variable outside a function has the same name as a local variable within the function,
                the variable outside the function is captured because the scope of the local variable does not start
                when the closure is defined. A warning is reported.

  @Description: Check that local variable with the same name to outer variable does not prevent outer variable
                capturing. Check that compiler emits a warning at this case.

  @Mode: run

  @Negative: no

  @CompileWarning: yes
*/

import utils.assert.Assert

main() {
    var x: Int64 = 3

    func foo() {
        var y = x * 2

        func bar() {
            var z = x * 3 // warning
            z
        }

        var x = y + 3 * bar()
        return x
    }

    Assert.equals(33, foo())
}

