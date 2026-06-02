/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_01_a01_01

  @Level:         1

  @Assertion:    13.1.3.1(1)  When passing parameters between the Cangjie
                 programming language and C, the primitive value types are
                 copied, such as int, short, etc.

  @Description:  Check if change of argument in foreign function is visible in cangjie.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(x: Int32): Int32

main() {
    var Arg : Int32 = 777;
    var Value : Int32 = unsafe { func_01(Arg) }
    Assert.equals(877, Value)
    Assert.equals(777, Arg)
}