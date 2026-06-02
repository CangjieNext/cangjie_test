/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a09_03

  @Level:         1

  @Assertion:    3.4.2(9) operator indicates that the function is an operator overload function, See Operator
                 Overloading for details

  @Description:  Check that struct can contain functions with operator modifier.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

struct Store {
    var localp = 0
    var foreignp = 0

    init(p: Int64) {
        localp = p
        foreignp = p + p / 10
    }

    init(p1: Int64, p2: Int64) {
        localp = p1
        foreignp = p2
    }

    operator func +(p: Int64): Store {
        return Store(localp + p, foreignp + p)
    }
}

main() {
    var obj1 = Store(100)

    Assert.equals(100, obj1.localp)
    Assert.equals(110, obj1.foreignp)

    var obj2 = obj1 + 50

    Assert.equals(150, obj2.localp)
    Assert.equals(160, obj2.foreignp)
}
