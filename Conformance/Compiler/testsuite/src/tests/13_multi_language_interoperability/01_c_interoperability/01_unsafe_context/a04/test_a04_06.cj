/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_01_a04_06

  @Level:         1

  @Assertion:    13.1.1(4) All unsafe functions and CFunc type functions must
                 be called in an unsafe context.

  @Description:  Check call of CFunc function in unsafe function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

@C
func func_01(x: Int32): Int32 { return x + 1000; }

unsafe func func_02(x : Int32) : Int32 { return 44 + func_01(x) }

main() {
    var Value : Int32 = unsafe { func_02(111) };
    Assert.equals(1155, Value);
}