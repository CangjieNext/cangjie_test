/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_01_02_a11_01

  @Level:         1
  @Assertion:       2.1.1.2(11) The following are examples relational operations on integers.
                        2 == 3 // result: false
                        2 != 3 // result: true
                        8 < 10 // result: true
                        9 <= 9 // result: true
                        24 > 28 // result: false
                        24 >= 23 // result: true

  @Description:     Check that the Spec example works.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore

*/

import utils.assert.Assert

main() {
    2 == 3 // result: false
    2 != 3 // result: true
    8 < 10 // result: true
    9 <= 9 // result: true
    24 > 28 // result: false
    24 >= 23 // result: true

    Assert.isFalse(2 == 3) // result: false
    Assert.isTrue(2 != 3) // result: true
    Assert.isTrue(8 < 10) // result: true
    Assert.isTrue(9 <= 9) // result: true
    Assert.isFalse(24 > 28) // result: false
    Assert.isTrue(24 >= 23) // result: true
}
