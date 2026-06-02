/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a10_01

  @Level:         1

  @Assertion: 10.2.4(10)
              Note that value is only a special token and does not need to be called as a named parameter when the
              index operator is assigned.

  @Description: Check usage of index access operator set form. Value does not need to be named in set form index
                operator call.

  @Mode: run

  @Negative: no

  @Comment: Actually, there is no syntax to provide "value" name for a named parameter in set form index operator call.
            So, there is no way to test scenario, when "value" name is provided.

*/

import utils.assert.Assert

class C {
    operator func[](index: Int64, value!: Int64) {
        x = value
    }

    var x = 0
}

main() {
    var c = C()
    Assert.equals(0, c.x)
    c[0] = 5 // No need to name "value".
    Assert.equals(5, c.x)
}

