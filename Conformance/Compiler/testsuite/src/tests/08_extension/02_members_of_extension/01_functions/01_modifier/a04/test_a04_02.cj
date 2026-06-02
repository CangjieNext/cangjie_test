/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a04_02

  @Level:         1

  @Assertion:   8.2.1.1(4) Functions that are not qualified with private, protected or public
                can only be used within this package.

  @Description: Checks that un-qualified functions can be used within this package (case: creating instance of the
                extended class in another file).

  @Mode:        run
  @Negative:    no
  @Structure:   complex-main
  @Dependencies: aux_test_a04_01.cj


*/

import utils.assert.Assert

import p1.AuxTestA0401
import p1.f1

main() {
    let x = AuxTestA0401()
    Assert.equals(6, f1(x))
    return 0
}
