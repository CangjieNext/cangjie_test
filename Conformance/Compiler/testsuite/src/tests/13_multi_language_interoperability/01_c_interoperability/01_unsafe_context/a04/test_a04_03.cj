/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_01_a04_03

  @Level:         1

  @Assertion:    13.1.1(4) All unsafe functions and CFunc type functions must
                 be called in an unsafe context.

  @Description:  Check call of unsafe function in unsafe context.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

unsafe func func_01(x: Int32): Int32 { return x + 1000; }

main() {
    var Value : Int32 = unsafe { func_01(44) };
    Assert.equals(1044, Value);
}