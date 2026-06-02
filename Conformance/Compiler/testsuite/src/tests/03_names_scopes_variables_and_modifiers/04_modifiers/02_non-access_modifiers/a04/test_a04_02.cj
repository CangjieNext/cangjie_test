/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a04_02

  @Level:         1

  @Assertion:    3.4.2(4) redef means redefine the static members of the parent class, See class for details

  @Description:  Check that static functions from classes and interfaces can be redefined in another package.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a04_02.cj
*/

package test02

import utils.assert.Assert
import aux_test_a04_02.*

class C2 <: C1 & I {
    redef public static func foo1() {
        return "redefined foo1"
    }

    redef public static func foo2() {
        return "redefined foo2"
    }
}

main() {
    var obj2 = C2()
    Assert.equals("redefined foo1", C2.foo1())
    Assert.equals("redefined foo2", C2.foo2())
}
