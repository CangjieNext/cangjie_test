/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a06_01

  @Level:         1

  @Assertion:    13.1.2.1(6)  Under @C modifier, the foreign keyword only allows
                 modify non-generic functions in the top-level scope.

  @Description:  @C + foreign + declaration of non-generic function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

@C foreign func func_01(x: Int16): Int16

main() {
    var Value : Int16 = unsafe{ func_01(222) }
    Assert.equals(322, Value)
}