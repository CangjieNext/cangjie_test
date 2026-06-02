/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a10_01

  @Level:         1

  @Assertion:    13.1.2.1(10) Multiple foreign function declarations can be
                 declared with foreign blocks. The foreign block is a sequence
                 of declarations enclosed by a pair of curly braces after the
                 foreign keyword.

  @Description:  two functions in foreign block.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign {
    func func_01(x: Int32): Int32
    func func_02(x: Int32): Int32
}  

main() {
    var Value : Int32 = unsafe { func_01(222) }
    Assert.equals(322, Value)
    var Value2 : Int32 = unsafe { func_02(222) }
    Assert.equals(-222, Value2)
}