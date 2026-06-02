/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a15_01

  @Level:         1

  @Assertion:    13.1.2.1(15) The foreign function should be able to link with
                 one defined in C language with the same name, and its
                 parameters type and return type need to be the same with the
                 one in original C language function.

  @Description:  Check call of foreign function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(x: Int32): Int32

main() {
    var Value : Int32 = unsafe{ func_01(222) }
    Assert.equals(322, Value)
}