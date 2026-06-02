
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        06_01_02_02_a14_01

  @Level:         1

  @Assertion:   6.1.2.2(14) - That means there is no guarantee that all static member variables of a parent class must
                be initialized before the initialization of the current class:
  @Description: Checks that static member variables of a parent class can be initialized after the initialization of
                its child class.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6136

*/

import utils.assert.Assert

var flag = false

class A <: B {
    static let a : Int64

    static init() {
        a = 1
        flag = true
    }
}

open class B {
    static let b : Int64

    static init() {
        Assert.equals(1, A.a)
        Assert.isTrue(flag)
        b = 2
    }
}

main() {
    Assert.isTrue(flag)
    Assert.equals(1, A.a)
    Assert.equals(2, B.b)
}
