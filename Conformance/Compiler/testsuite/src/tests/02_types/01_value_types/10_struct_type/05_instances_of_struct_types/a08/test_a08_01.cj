/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_05_a08_01

  @Level:         1

  @Assertion:       2.1.10.5(8) if structInstance is defined using var and varName is also defined using var,
                    structInstance.varName = expr is supported to modify the value of member variable varName.

  @Description:     Check that it is possible to change a member variable defined with `var` on a mutable struct
                    instance.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

struct S {
    var varName = 15
}

main() {
    var structInstance = S()
    Assert.equals(15, structInstance.varName)
    structInstance.varName = 13
    Assert.equals(13, structInstance.varName)
}
