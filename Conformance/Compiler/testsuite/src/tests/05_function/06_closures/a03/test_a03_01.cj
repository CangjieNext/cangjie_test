/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 05_06_a03_01

  @Level:         1

  @Assertion: 5.6(3) Variable capture occurs when the closure is defined.

              The following scenarios are not variable captures:

              * Access to local variables defined in the function or the lambda;
              * Access to parameters of the function or the lambda;
              * Access of global variables and static member variables in a function or lambda;
              * Access of instance member variables in instance member functions. Since the instance member function
                passes this as a parameter, all instance member variables are accessed through this within the instance
                member function. 

  @Description: Check that variable capture occurs when closure is defined. Use cheat that variable must be initialized
                before capturing. Hence, compilation error on uninitialzd capture means that capture happened,

  @Mode: compileonly

  @Negative: yes

  @Comment: There are no side-effects on variables capture. So, capturing is tested indirectly. Listed non-capturing
            scenarios can not be checked in the same way, because all of them must be initialized. No way to check that
            "successful access without initialization means that capture actually not happened".
*/

main() {
    var x: Int64

    func foo() {
        // Compilation error because 'x' is captured being uninitialized.
        x * 2
    }

    x = 4

    foo()
}

