/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a06_03

  @Level:         1

  @Assertion:    3.4.2(6) abstract means the class is an abstract class, See class for details

  @Description:  Check that abstract classes are not required to have abstract functions.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        6124
*/

import utils.assert.Assert

abstract class C1 {
    static protected let PI = 3.14

    public var currentYear = 2023

    static func foo2() {
        return "foo2"
    }

    static mut prop b: Int64 {
        get() { 1 }
        set(p) { b = p }
    }
}

class C2 <: C1 {}

main() {
    Assert.equals(3.14, C1.PI)
    Assert.equals("foo2", C1.foo2())
    Assert.equals(1, C1.b)

    var obj = C2()
    Assert.equals(2023, obj.currentYear)
}
