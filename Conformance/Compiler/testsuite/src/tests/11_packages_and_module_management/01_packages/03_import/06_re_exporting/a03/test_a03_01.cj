/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_03_06_a03_01

  @Level:         1

  @Assertion:    11.1.3.6(3) Other packages can import and use the re-exported 
                 content directly without importing it from its original package.  

  @Description:  Check that other packages can import and use the re-exported 
                 content directly without importing it from its original package

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a03_03.cj

 */

package p4

import p1.*
import p2.*
import p3.*

import utils.assert.Assert

main() {
    Assert.equals("Hello World", AuxTestA0301.hello("World"))
    Assert.equals("Hello World", AuxTestA0301.hello("World"))
    Assert.equals("Hello World", AuxTestA0301.hello("World"))
    Assert.equals("Hello World", AuxTestA0301.hello("World"))
    Assert.equals("Hello World", AuxTestA0301.hello("World"))
}
