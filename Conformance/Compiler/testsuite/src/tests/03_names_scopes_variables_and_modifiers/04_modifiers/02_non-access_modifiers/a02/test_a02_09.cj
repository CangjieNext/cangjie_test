/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a02_09

  @Level:         1

  @Assertion:    3.4.2(2) open indicates that the instance member can be overridden by a subclass,
                 or that the class can be inherited by a subclass, See class for details

  @Description:  Check that subclass can override superclass public open functions from another package.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_test_a02_09.cj
*/

package test14

import utils.assert.Assert
import aux_test_a02_09.*

class C2 <: AuxTestA0209 {
    override public func f1() {
        return "new foo"
    }
}

main() {
    var obj1 = AuxTestA0209()
    var obj2 = C2()
    Assert.equals("foo", obj1.f1())
    Assert.equals("new foo", obj2.f1())
}
