/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a40_01

  @Level:         1

  @Assertion: 6.1.2.4(40)
              Static member functions cannot be modified with open.

  @Description: Check that static functions without the 'open' modifier
                do not cause errors

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class Test {
    static func a(x: String) {
        return x
    }
    static func b<T>(x: T) {
        return x
    }

    private static func c(x: Int64) {
        return x
    }
    private static func d<T>(x: T) {
        return x
    }

    protected static func e(x: Bool) {
        return x
    }
    protected static func f<T>(x: T) {
        return x
    }

    public static func g(x: Rune) {
        return x
    }
    public static func h<T>(x: T) {
        return x
    }

    static func test() {
        Assert.equals("12", Test.a("12"))
        Assert.equals([0, 0, 0], Test.b<Array<Int64>>([0, 0, 0]))
        Assert.equals(155, Test.c(155))
        Assert.equals(1..=19:18, Test.d<Range<Int64>>(1..=19:18))
        Assert.equals(false, Test.e(false))
        Assert.approxEquals(0.001f16, Test.f<Float16>(0.001f16))
        Assert.equals(r'i', Test.g(r'i'))
        Assert.equals(5i16, Test.h<Int16>(5i16))
    }
}

main() {
    Test.test()
}