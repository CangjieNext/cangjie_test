/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_03_a01_04

  @Level:         1
  @Assertion:       2.1.10.3(1) Member functions, member attributes and a static initializer can also be defined in
                    struct.

  @Description:     Check that there are no errors when creating a struct with an operator function.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Comment:         Operator overloading isn't mentioned in the assertion text, but it's mentioned somewhat further
                    down (unverifiable assertion):
                    See Section operator overloading for the syntax of defining operator functions.
  @Issue:           0006405

*/

import utils.assert.Assert

struct S {
    operator func +(right: Int64) { right }
}

main() {
    Assert.equals(0, S() + 0)
}
