/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_01_a04_r_02

  @Level:         1

  @Assertion:    13.1.1(4) All unsafe functions and CFunc type functions must
                 be called in an unsafe context.

  @Description:  Check call of foreign function from unsafe function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func func_01(x: Int32, y:Int32): Int32

unsafe func func_u(x : Int32) : Int32 {
  1000 + func_01(x, 10)
}

main() {
    var Value : Int32 = unsafe { func_u(111); };
    Assert.equals(1131, Value);
}