/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         14_02_04_a01_01

  @Level:         1

  @Assertion:    14.2.4(1) Macro definitions can have nested calls to other macros.
 
  @Description:  Check that macro definitions can have nested calls to other macros
  
  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_macros_01.cj

*/

import utils.assert.Assert
import aux_macros_01.*

main(): Unit {
    let r = @compile(555)
    Assert.equals(444, r)
}
