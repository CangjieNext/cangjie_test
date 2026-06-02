/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_05_a01_01

  @Level:         1

  @Assertion: 6.3.5(1)
              The access modifier level is specified as follows
              based on the allowed access scope of the access modifier:
              • Access modifier level: public > protected > default > private.

  @Description: Check that functions with the 'public' modifier have the most
                permissive access level.

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a01_p01_aux.cj

  @Comment: The current chapter is about the redefenition and overriding. So only functions are tested.

*/

import utils.assert.Assert
import p01.*

class Local <: A01P01Aux {
    public func f5() {
        return 5
    }

    public func f6<T>() {
        return 6
    }

    public static func f7() {
        return 7
    }

    public static func f8<T>() {
        return 8
    }

    func check() {
        Assert.equals(1, f1())
        Assert.equals(2, f2<Unit>())
        Assert.equals(3, f3())
        Assert.equals(4, f4<Unit>())
        Assert.equals(5, f5())
        Assert.equals(6, f6<Unit>())
        Assert.equals(7, f7())
        Assert.equals(8, f8<Unit>())
    }
}

extend A01P01Aux {
    func check_extension() {
        Assert.equals(1, f1())
        Assert.equals(2, f2<Unit>())
        Assert.equals(3, f3())
        Assert.equals(4, f4<Unit>())
    }
}

main() {
    Assert.equals(1, A01P01Aux().f1())
    Assert.equals(2, A01P01Aux().f2<Unit>())
    Assert.equals(3, A01P01Aux.f3())
    Assert.equals(4, A01P01Aux.f4<Unit>())

    Local().check()
    A01P01Aux().check_extension()
}