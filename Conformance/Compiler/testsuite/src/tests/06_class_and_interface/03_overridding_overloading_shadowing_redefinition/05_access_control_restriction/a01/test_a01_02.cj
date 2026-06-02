/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_05_a01_02

  @Level:         1

  @Assertion: 6.3.5(1)
              The access modifier level is specified as follows
              based on the allowed access scope of the access modifier:
              • Access modifier level: public > protected > default > private.

  @Description: Check that functions with the 'protected' modifier are visible
                in subclasses, in extensions, inside the defining class and outside of the class in the same package

  @Mode: run

  @Negative: no

  @Structure: complex-main

  @Dependencies: a01_p02_aux.cj

  @Comment: The current chapter is about the redefenition and overriding. So only functions are tested.

*/

import utils.assert.Assert
import p02.*

class Local <: A01P02Aux {
    protected func f5() {
        return 5
    }

    protected func f6<T>() {
        return 6
    }

    protected static func f7() {
        return 7
    }

    protected static func f8<T>() {
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

extend A01P02Aux {
    func check_extension() {
        Assert.equals(1, f1())
        Assert.equals(2, f2<Unit>())
        Assert.equals(3, f3())
        Assert.equals(4, f4<Unit>())
    }
}

main() {
    Assert.equals(5, Local().f5())
    Assert.equals(6, Local().f6<Unit>())
    Assert.equals(7, Local.f7())
    Assert.equals(8, Local.f8<Unit>())

    Local().check()
    A01P02Aux().check_extension()
}
