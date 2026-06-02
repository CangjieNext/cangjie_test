/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_10_05_a06_01

  @Level:         1

  @Assertion:       2.1.10.5(6) Some examples are given below:
                    let newRectangle2_1 = Rectangle2<Int32>(100) // Invoke the custom constructor.
                    let newRectangle2_1 = Rectangle2<Int32>(width2: 10, length2: 20) // Invoke another custom
                    constructor.

  @Description:     Check that it's possible to create a generic struct instance using the above-mentioned notation.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

  @Issue:           0006469

*/

import utils.assert.Assert

struct Rectangle2<T> {
    let width2: T
    let length2: T
    init (width2!: T, length2!: T) {
        this.width2 = width2
        this.length2 = length2
    }
    init (side: T) {
        this(width2: side, length2: side)
    }
}

main() {
    let newRectangle2_1 = Rectangle2<Int32>(100) // Invoke the custom constructor.
    let newRectangle2_2 = Rectangle2<Int32>(width2: 10, length2: 20) // Invoke another custom constructor.

    Assert.equals(100, newRectangle2_1.width2)
    Assert.equals(100, newRectangle2_1.length2)
    Assert.equals(10, newRectangle2_2.width2)
    Assert.equals(20, newRectangle2_2.length2)
}
