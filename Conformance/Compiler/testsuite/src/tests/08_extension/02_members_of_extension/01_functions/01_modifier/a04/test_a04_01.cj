/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_02_01_01_a04_01

  @Level:         1

  @Assertion:   8.2.1.1(4) Functions that are not qualified with private, protected or public
                can only be used within this package.

  @Description: Checks that un-qualified functions can be used within this package (single file case).

  @Mode:        run
  @Negative:    no
  @Structure:   single


*/

import utils.assert.Assert

class A {}

extend A {
    func foo1(): Int64 { 7 }
}

main() {
    let x = A()
    Assert.equals(7, x.foo1())
    return 0
}
