/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a16_01

  @Level:         1

  @Assertion: 6.1.2.4(16)
              Meanwhile, a static function must have a function body.

  @Description: Check that static functions with a body work correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
    static func a() {}
    static func b<T1, T2>() {}

    static func c() {
        return 1
    }
    static func d<T>() {
        return 2
    }
    
    static func e(x: String, y: Bool) {}
    static func f<T>(x: T, y!: T) {}

    static func g(p1: Rune, p2!: Int64, p3!: Bool = false) {
        return "${p1}${p2}${p3}"
    }
    static func h<T>(x: T) where T <: ToString {
        return "${x}"
    }
}

main() {
    Assert.isTrue(Test.a() is Unit)
    Assert.isTrue(Test.b<Rune, Int32>() is Unit)
    Assert.equals(1, Test.c())
    Assert.equals(2, Test.d<Any>())
    Assert.isTrue(Test.e("", false) is Unit)
    Assert.isTrue(Test.f<Unit>((), y: ()) is Unit)
    Assert.equals("o12false", Test.g(r'o', p2: 12, p3: false))
    Assert.equals("[0, 0, 0]", Test.h<Array<Int64>>([0 ,0, 0]))
}