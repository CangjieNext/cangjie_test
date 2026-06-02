/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_03_a02_01

  @Level:         1

  @Assertion: 6.1.3(2)
              The Object type has a public constructor that has no parameter.

  @Description: Check that the Object type can be instantiated through a parameterless constructor
                outside the package where the Object is defined

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

main() {
    let x = Object()
    Assert.isTrue(x is Object)
}