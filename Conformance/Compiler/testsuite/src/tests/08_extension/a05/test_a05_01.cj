/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        08_a05_01

  @Level:         1

  @Assertion:   8(5) Features that can be added include: Adding Instance Member Properties.

  @Description: Checks that instance member properties can be added to class extension.

  @Mode:        run
  @Negative:    no
  @Structure:   single
  @Issue: 6124


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
    mut prop pX: Int64 {
        get() { x }
        set(v) { x = v }
    }
    mut prop pY: Int64 {
        get() { y }
        set(v) { y = v }
    }
}

main() {
    let x = Point(20, 50)
    Assert.equals(20, x.pX)
    Assert.equals(50, x.pY)
    x.pX = 30
    x.pY = 40
    Assert.equals(30, x.pX)
    Assert.equals(40, x.pY)
}
