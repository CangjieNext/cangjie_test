/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a10_05

  @Level:         1

  @Assertion:    3.4.2(10) sealed means that the class or interface can only be inherited or implemented in the current
                 package, See class for details

  @Description:  Check that sealed classes and interfaces are visible from another package without public modifier.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a10_05.cj

  @Issue:        6084

*/

import utils.assert.Assert
import aux_test_a10_05.*

main() {
    Assert.equals(0, C.sv)
    Assert.equals(1, C.sl)
    Assert.equals(2, C.sf())
}
