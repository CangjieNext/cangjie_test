/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a17_02

  @Level:         1

  @Assertion: 5.6(17) The following rules must be met for captured variables: 

              * If there is a variable outside a function has the same name as a local variable within the function,
                the variable outside the function is captured because the scope of the local variable does not start
                when the closure is defined. A warning is reported.

  @Description: Check that exactly external variable is captured. Check that by capturing uninitialized external
                variable which must lead to a compilation error.

  @Mode: compileonly

  @Negative: yes

  @CompileWarning: yes
*/

main() {
    var x: Int64

    func foo() {
        func bar() {
            var z = x * 3 // Capturing uninitilized external variable x
            z
        }

        var x = 3
        x *= bar()
        return x
    }

    x = 5
}

