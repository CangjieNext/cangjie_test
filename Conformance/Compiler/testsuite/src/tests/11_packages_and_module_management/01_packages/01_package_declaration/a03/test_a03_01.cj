/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_01_a03_01

  @Level:         1

  @Assertion:    11.1.1(3) The package declaration in the following example means 
                 that the source file a.cj and b.cj are in the p1 and p2 package respectively.

  @Description:  Check that Package declaration should begin with the keyword package, followed 
                 by the package name

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: a.cj b.cj

*/

import p1
import p2

import utils.assert.Assert

main() {
    Assert.equals("p1", p1.packageName())
    Assert.equals("p2", p2.packageName())
    return 0
}
