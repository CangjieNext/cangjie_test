/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_04_02_a04_01

  @Level:         1

  @Assertion:    2.4.2(4) 
                    type A = B
                    class B {}
                    func foo() { A() } // Use type alias A as constructor of B

  @Description:  Check example

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

type A = B
class B {}
func foo() { A() } // Use type alias A as constructor of B

main(): Unit {
    Assert.isTrue(foo() is A)
    Assert.isTrue(foo() is B)
    Assert.isTrue(foo() is Object)
}
