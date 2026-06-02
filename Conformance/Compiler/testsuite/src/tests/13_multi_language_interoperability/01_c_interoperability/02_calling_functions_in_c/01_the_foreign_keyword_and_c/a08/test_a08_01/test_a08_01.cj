/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a08_01

  @Level:         1

  @Assertion:    13.1.2.1(8)  The foreign function modifier allows providing
                 functions that can be called with native C ABI and no name
                 mangling.

  @Description:  Check call of C ABI function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(x: Int64, y : Int64): Int64

main() {
    var Value : Int64= unsafe { func_01(2, 7) }
    Assert.equals(72, Value)
}