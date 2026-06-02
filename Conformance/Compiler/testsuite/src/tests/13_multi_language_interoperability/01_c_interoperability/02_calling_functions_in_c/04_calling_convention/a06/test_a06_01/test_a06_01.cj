/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_04_a06_01

  @Level:         1

  @Assertion:    13.1.2.4(6) When @CallingConv modifies a foreign block, the
                 same @CallingConv modifier is added to each function in the
                 foreign block.

  @Description:  @CallingConv on foreign block.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

@CallingConv[CDECL]
foreign {
    func func_01(x: Int32, ...): Int32
    func func_02(x: Int32, ...): Int32
}

main() {
    var Value : Int32 = unsafe { func_01(3, 222, 111, 3) }
    Assert.equals(336, Value)
    var Value2 : Int32 = unsafe { func_02(3, 222, 111, 3) }
    Assert.equals(73926, Value2)
}