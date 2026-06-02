/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_02_a10_01

  @Level:         1

  @Assertion:    13.1.2.2(10) When CFunc is invoked in Cangjie code, it needs
                 to be in an unsafe context.

  @Description:  Call CFunc in unsafe context.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

@C
func func_01(x: Int32) : Int32 {
    return x + 44
}

main() {
    var CB: CFunc<(Int32)->Int32> = func_01
    var Arg : Int32 = 1000;
    var Value : Int32 = unsafe { CB(Arg) }
    Assert.equals(1044, Value)
}