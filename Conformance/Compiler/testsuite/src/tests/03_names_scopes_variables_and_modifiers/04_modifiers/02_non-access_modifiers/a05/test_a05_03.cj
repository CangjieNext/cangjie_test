/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a05_03

  @Level:         1

  @Assertion:    3.4.2(5) static means that the member is a static member, and static members cannot be accessed
                 through instance objects, See class for details

  @Description:  Check that generic static functions can be accessed using the type name without instantiation.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a05_03.cj
*/

package test03

import utils.assert.Assert
import aux_test_a05_03.*

class C1 {
    static func foo<T>(p: T) {
        return p
    }
}

main() {
    Assert.equals(64, (C1.foo<Int64>(64)))
    Assert.equals(32, (AuxTestA0503.foo<Int32>(32)))
}
