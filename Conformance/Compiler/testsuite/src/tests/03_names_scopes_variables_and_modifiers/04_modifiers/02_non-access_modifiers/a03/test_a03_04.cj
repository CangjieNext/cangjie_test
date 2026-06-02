/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a03_04

  @Level:         1

  @Assertion:    3.4.2(3) override means overriding a member of the parent class, See class for details

  @Description:  Check that overriden functions can have different parameter names.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

open class C1 {
    public open func addOne(a: Int32) {
        return a + 1
    }
}

class C2 <: C1 {
    override public func addOne(b: Int32) {
        return b + 1
    }
}

main() {
    var obj1 = C1()
    var obj2 = C2()
    Assert.equals(2023, obj1.addOne(2022))
    Assert.equals(2023, obj2.addOne(2022))
}
