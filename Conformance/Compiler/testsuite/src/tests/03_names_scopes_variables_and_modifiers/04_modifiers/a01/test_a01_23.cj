/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_a01_23

  @Level:         1

  @Assertion:    3.4 (1) Cangjie provides a number of modifiers, which fall into the following two main categories.
                    Access modifiers 
                    Non-access modifiers 

  @Description:  Checks that a operator modifier for function class member overloads the operations.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

class Point {
    var x: Int32 = 0
    var y: Int32 = 0
    init (a: Int32, b: Int32) {
        x = a
        y = b
    }

    operator func -(): Point {
        return Point(-x, -y)
    }

    operator func +(right: Point): Point {
        return Point(x + right.x, y + right.y)
    }
}

main(): Int64 {
    let p1 = Point(8, 24)
    let p2 = -p1
    Assert.equals(-8,  p2.x)
    Assert.equals(-24, p2.y)

    let p3 = p1 + p2 // p3 = Point(0, 0)
    Assert.equals(0,  p3.x)
    Assert.equals(0, p3.y)

    return 0
}
