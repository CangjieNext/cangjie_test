/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_02_01_a03_01

  @Level:         1

  @Assertion:    13.1.2.1(3)  @C supports only modifying foreign functions,
                 non-generic functions and struct types in the top-level scope.


  @Description:  '@c' with 'foreign' function.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

  @Issue: 0006421
*/

import utils.assert.Assert

@C
foreign func func_01(x: Int32): Int32

main() {
    var Value : Int32 = unsafe { func_01(222); };
    Assert.equals(-222, Value);
}