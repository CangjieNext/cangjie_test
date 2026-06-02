/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a03_01

  @Level:         1

  @Assertion: 10.2.4(3)
              The sequence of arguments within the index operator value form [] corresponds to the non-named arguments
              of the operator overload, and can be 1 or more, and can be of any type.

  @Description: Check usage of index operator overloading with several indices.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class C {
    operator func[](i1: Int64, i2: Int64) {
        match (i1) {
            case 0 => x + i2
            case 1 => y + i2
            case _ => z + i2
        }
    }

    operator func[](i1: Int64,  i2: Int64, value!: Int64) {
        match (i1) {
            case 0 => x = value + i2
            case 1 => y = value + i2
            case _ => z = value + i2
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
    Assert.equals(1, c[0, 1])
    Assert.equals(2, c[1, 2])
    Assert.equals(3, c[2, 3])

    c[0, 1] = 5
    c[1, 2] = 5
    c[2, 3] = 5

    Assert.equals(6, c.x)
    Assert.equals(7, c.y)
    Assert.equals(8, c.z)
    Assert.equals(7, c[0, 1])
    Assert.equals(8, c[1, 1])
    Assert.equals(9, c[2, 1])
}

