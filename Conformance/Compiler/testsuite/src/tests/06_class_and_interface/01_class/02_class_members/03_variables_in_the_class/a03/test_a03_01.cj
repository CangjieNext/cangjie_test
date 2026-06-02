/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_03_a03_01

  @Level:         1

  @Assertion: 6.1.2.3(3)
              The initial value expression can use the previously declared instance member variables.

  @Description: Check that instance member variable declarations inside the class
                can use previously declared and initialized instance member variables
                as initial values

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

func f(x: Int64) {
    return x + 1
}

class Test {
    public var a = 1
    public let b = a + 1
    protected var c = a + b
    protected let d = c * a + b
    private var e = (a + b) - (c + d)
    private let f = a * b - f(c * d) + e
    var g = a * b * c * d * e * f
    let h = g / (a + b) - c * d + e - f

    func test() {
        Assert.equals(1, this.a)
        Assert.equals(2, this.b)
        Assert.equals(3, this.c)
        Assert.equals(5, this.d)
        Assert.equals(-5, this.e)
        Assert.equals(-19, this.f)
        Assert.equals(2850, this.g)
        Assert.equals(949 , this.h)
    }
}

main() {
    let x = Test()
    x.test()
}