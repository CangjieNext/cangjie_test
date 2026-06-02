/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a04_01

  @Level:         1

  @Assertion:   8(4) Features that can be added include: Adding Operator Overloading.

  @Description: Checks that operator overloading can be added to class extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue:       


*/

import utils.assert.Assert

class Point {
    var x: Int64 = 0
    var y: Int64 = 0

    init (a: Int64, b: Int64) {
        x = a
        y = b
    }
}

extend Point {
    operator func -(p: Point): Point {
        Point(x - p.x, y - p.y)
    }

    operator func -(): Point {
        Point(-x, -y)
    }
    
    operator func +(p: Point): Point {
        Point(x + p.x, y + p.y)
    }
}

main() {
    let x1 = Point(20, 50)
    let x2 = Point(-5, 3)
    let y1 = x1 + x2
    Assert.equals(15, y1.x)
    Assert.equals(53, y1.y)
    let y2 = x1 - x2
    Assert.equals(25, y2.x)
    Assert.equals(47, y2.y)
    let y3 = -x2
    Assert.equals(5, y3.x)
    Assert.equals(-3, y3.y)
}
