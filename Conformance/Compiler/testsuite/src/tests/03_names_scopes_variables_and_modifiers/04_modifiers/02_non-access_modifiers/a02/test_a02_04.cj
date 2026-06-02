/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a02_04

  @Level:         1

  @Assertion:    3.4.2(2) open indicates that the instance member can be overridden by a subclass,
                 or that the class can be inherited by a subclass, See class for details

  @Description:  Check that open class can be generic.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

open class C1<T> {
    func f1(p: T) {
        return p
    }
}

class C2 <: C1<Int64> {

}

main() {
    var obj = C2()
    Assert.equals(1, obj.f1(1))
}
