/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a03_03

  @Level:         1

  @Assertion: 5.6(3) Variable capture occurs when the closure is defined.

              The following scenarios are not variable captures:

              * Access to local variables defined in the function or the lambda;
              * Access to parameters of the function or the lambda;
              * Access of global variables and static member variables in a function or lambda;
              * Access of instance member variables in instance member functions. Since the instance member function
                passes this as a parameter, all instance member variables are accessed through this within the instance
                member function. 

  @Description: Check that access to global variable is not a capture. Use the folloing trick for checking: make
                the global variable mutable. If it is a capture, the closure is not a first-class citizen and
                can not be used as return value. But test checks that closure can be used as return value, so, first-
                class-citizen property is not broken, so, actual capture has not happen.

  @Mode: run

  @Negative: no
*/

import utils.assert.Assert

var global = 0

func foo() {
    func bar() {
        global = 3 // Access to mutable global.
        global * 2
    }

    return bar // First-class citizen -> global is not captured.
}

main() {
    var f = foo()
    Assert.equals(6, f())
}

