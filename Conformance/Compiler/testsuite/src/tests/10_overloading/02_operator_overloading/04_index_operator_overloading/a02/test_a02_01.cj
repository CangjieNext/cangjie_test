/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a02_01

  @Level:         1

  @Assertion: 10.2.4(2)
              Index operator overloading does not require both forms to be overloaded, and can overload only
              assignment without overloading fetch, or vice versa.

  @Description: Check usage of set index operator without get.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    operator func[](index: Int64, value!: Int64) {
        match (index) {
            case 0 => x = value
            case 1 => y = value
            case _ => z = value
        }
    }

    var x = 0
    var y = 0
    var z = 0
}

main() {
    var c = C()

    Assert.equals(0, c.x)
    Assert.equals(0, c.y)
    Assert.equals(0, c.z)

    c[0] = 5
    c[1] = 6
    c[2] = 7

    Assert.equals(5, c.x)
    Assert.equals(6, c.y)
    Assert.equals(7, c.z)
}

