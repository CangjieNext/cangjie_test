/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_a01_18

  @Level:         1

  @Assertion:    3.4 (1) Cangjie provides a number of modifiers, which fall into the following two main categories.
                    Access modifiers 
                    Non-access modifiers 

  @Description:  Checks that the behavior of parent function cannot be changed after inheretance.

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class A {
    static func f1(a : Int32, b : Int32) {
        return a + b
    }

    static func f2(a : Int32, b : Int32) {
        return a - b
    }
}

class B <: A {}

main() {
    Assert.equals(3, A.f1(1, 2))
    Assert.equals(3, B.f1(1, 2))

    Assert.equals(1, A.f2(10, 9))
    Assert.equals(1, B.f2(10, 9))
}
