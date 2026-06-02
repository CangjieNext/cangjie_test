/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 02_01_10_02_a32_01

  @Level:         1

  @Assertion: 2.1.10.2(32)
              The parameters of the constructor can have default values.

  @Description: Check that a constructor can have parameters with default values

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

struct TestNoDefault {
    init(
        p1!: Int64,
        p2!: Int64,
        p3!: Int64,
        p4!: Int64,
        p5!: Int64,
        p6!: Int64
    ) {
        Assert.equals(10, p1)
        Assert.equals(20, p2)
        Assert.equals(30, p3)
        Assert.equals(40, p4)
        Assert.equals(50, p5)
        Assert.equals(60, p6)
    }
}

struct Default {
    init(
        p1!: Int64 = 1,
        p2!: Int64 = 2,
        p3!: Int64 = 3,
        p4!: Int64 = 4,
        p5!: Int64 = 5,
        p6!: Int64 = 6
    ) {
        Assert.equals(1, p1)
        Assert.equals(2, p2)
        Assert.equals(3, p3)
        Assert.equals(4, p4)
        Assert.equals(5, p5)
        Assert.equals(6, p6)
    }
}

struct DefaultUnused {
    init(
        p1!: Int64 = 1,
        p2!: Int64 = 2,
        p3!: Int64 = 3,
        p4!: Int64 = 4,
        p5!: Int64 = 5,
        p6!: Int64 = 6
    ) {
        Assert.equals(100, p1)
        Assert.equals(200, p2)
        Assert.equals(300, p3)
        Assert.equals(400, p4)
        Assert.equals(500, p5)
        Assert.equals(600, p6)
    }
}

main() {
    let case1 = TestNoDefault(p1:10, p2: 20, p3: 30, p4: 40, p5: 50, p6: 60)
    let case2 = Default()
    let case3 = DefaultUnused(p1:100, p2: 200, p3: 300, p4: 400, p5: 500, p6: 600)
}