/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        11_01_03_04_a01_02

  @Level:         1

  @Assertion:   11.1.3.4(1) A package can import multiple declarations for the same 
                 package, which can be done in one of three ways. 

  @Description:  Check that package can import multiple declarations : no space symbol before the comma

  @Mode:         run

  @Negative:     no
  
  @Structure:    complex-main

  @CompileWarning:  yes

  @Dependencies: aux_test_a01_02.cj aux_test_a01_03.cj

*/

import way2
import way3
import way2.{packageName,PI}
import way3.{packageName,G}

import utils.assert.Assert

main() {
    Assert.equals("way2", way2.packageName())
    Assert.equals(3.14, way2.PI)
    Assert.equals(3.14, PI)

    Assert.equals("way3", way3.packageName())
    Assert.equals(9.8, way3.G)
    Assert.equals(9.8, G)
}
