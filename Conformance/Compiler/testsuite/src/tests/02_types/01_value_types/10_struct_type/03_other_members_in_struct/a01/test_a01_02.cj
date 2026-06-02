/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_03_a01_02

  @Level:         1
  @Assertion:       2.1.10.3(1) Member functions, member attributes and a static initializer can also be defined in
                    struct.

  @Description:     Check that there are no errors when creating a struct with member properties (instance member
                    property, static member property).

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Comment:         I assume that there is a semantic error in the assertion text and instead of "member attributes"
                    there should be "member properties". Therefore, this test about defining properties in structs has
                    been added. The problem is described in the issue 6405.
  @Issue:           0006405

*/

import utils.assert.Assert

struct S {
    static prop statProp: Unit {
        get() { Assert.isTrue(true) }
    }
    prop instanceProp: Unit {
        get() { statProp }
    }
}

main() {
    S.statProp
    S().instanceProp
}
