/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a05_01

  @Level:         1

  @Assertion:    13.1.2.1(5)  Unless otherwise specified, the foreign function
                 in the C interoperability is considered as a foreign function
                 modified by @c.

  @Description:  Check call of foreign function with and without @c.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

foreign func func_01(x: Int32): Int32
@C foreign func func_02(x: Int32): Int32

main() {
    var Value : Int32 = unsafe { func_01(222) }
    Assert.equals(322, Value)
    var Value2 : Int32 = unsafe { func_02(222) }
    Assert.equals(-222, Value2)
}