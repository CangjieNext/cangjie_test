/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_04_a03_01

  @Level:         1

  @Assertion:    13.1.2.4(3) For C functions that are called through the C
                 language interoperability mechanism, if the calling convention
                 is not specified, the default CDECL calling convention is used. 

  @Description:  Check call of foreign function with default calling conventions.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(x: Int32, ...): Int32

main() {
    var Value : Int32 = unsafe { func_01(3, 222, 111, 3) }
    Assert.equals(336, Value)
}