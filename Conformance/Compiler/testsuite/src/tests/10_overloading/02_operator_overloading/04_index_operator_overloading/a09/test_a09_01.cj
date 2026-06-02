/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a09_01

  @Level:         1

  @Assertion: 10.2.4(9)
              The return type must be of type Unit.

  @Description: Check Unit type of set form of index access operators.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    operator func[](index: Int64, value!: Int64): Unit {
        x = value
    }

    var x = 0
}

main() {
    var c = C()
    Assert.equals(0, c.x)
    Assert.isTrue((c[0] = 5) is Unit)
    Assert.equals(5, c.x)
}

