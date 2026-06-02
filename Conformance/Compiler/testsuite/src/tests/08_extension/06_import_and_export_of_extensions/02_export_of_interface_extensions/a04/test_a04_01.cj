/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_06_02_a04_01

  @Level:         1

  @Assertion:       8.6.2(4) The exported extension cannot indirectly export the functions of the non-exported extension. Otherwise, an error is reported during compilation.

  @Description:     Exported extensions cannot export the functions of non-exported extensions, otherwise a compilation error will be reported.
  
  @Mode:            compileonly

  @Negative:        yes

  @Structure:       complex-main

  @Dependencies:    aux_extend_test_a04_01.cj aux_test_a04_01.cj

*/

package c

import utils.assert.Assert
import b.*


main() {
    var myClassImpl = AuxTestA0401()
    Assert.equals(1, myClassImpl.test1())
}
