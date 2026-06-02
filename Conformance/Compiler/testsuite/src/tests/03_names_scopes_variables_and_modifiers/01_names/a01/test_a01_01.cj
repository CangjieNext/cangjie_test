/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            03_01_a01_01

  @Level:         1
  @Assertion:       3.1(1) In the Cangjie programming language, we use names to identify entities such as variables,
                    functions, types, packages and modules. The name must be a valid [Identifier].

  @Description:     Check that different names identify different entities and types. Names for variables, 
                    functions and types are checked.

  @Mode:            run
  @Negative:        no
  @Structure:       complex-main
  @Dependencies:    aux_test_a01_01.cj
  @CompileWarning:  no

*/

import package3111.f

import utils.assert.Assert

main() {
    var nameVar: Int64 = 5
    Assert.equals("nameVar=5", "nameVar=${nameVar}")
    nameVar = nameVar + 1
    Assert.equals("nameVar=6", "nameVar=${nameVar}")

    func nameFun(val: UInt64) { val + 2 }
    Assert.equals(12, nameFun(10))

    Assert.isTrue(nameVar is Int64)

    Assert.equals(25, f())
}
