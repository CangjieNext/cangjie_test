/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_02_a02_01

  @Level:         1

  @Assertion:    13.1.3.2(2)  There are some rules on CPointer type:
                 * its size and alignment is platform dependent.

  @Description:  

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01() : CPointer<Int32>
foreign func func_02(x: CPointer<Int32>): Int32

main() {
    var Ptr : CPointer<Int32> = unsafe{ func_01() }
    var Val: Int32 = unsafe{ func_02(Ptr) }
    Assert.isTrue(4 <= Val)
}