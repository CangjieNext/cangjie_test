/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_03_a01_01

  @Level:         1
  @Assertion:       2.1.10.3(1) Member functions, member attributes and a static initializer can also be defined in
                    struct.

  @Description:     Check that there are no errors when creating a struct with member functions (non-abstract member
                    function, static member function, static member function and generic static member function).

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006405

*/

import utils.assert.Assert

struct S {
    static func staticF() { Assert.isTrue(true) }
    static func staticGenericF<T>() { Assert.isTrue(true) }
    func nonAbstractF() { Assert.isTrue(true) }
    func nonAbstractGenericF<T>() { Assert.isTrue(true) }
}

main() {
    S.staticF()
    S.staticGenericF<Nothing>()
    S().nonAbstractF()
    S().nonAbstractGenericF<Nothing>()
}
