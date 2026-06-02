/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_02_01_a02_01

  @Level:         1

  @Assertion: 6.2.2.1(2)
              The following are examples containing abstract functions.
              interface MyInterface {
                func f1(): Unit // Default implementation not included
                static func f2(): Unit // Default implementation not included
                func f3(): Unit { // Default implementation included
                  return
                }
                static func f4(): Unit { // Default implementation included
                  return
                }
              }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

interface MyInterface {
    func f1(): Unit // Default implementation not included
    static func f2(): Unit // Default implementation not included

    func f3(): Unit { // Default implementation included
        return
    }

    static func f4(): Unit { // Default implementation included
        return
    }
}

class A <: MyInterface {
    override public func f1() {}
    redef public static func f2() {}
}

main() {
    Assert.isTrue(A().f1() is Unit)
    Assert.isTrue(A.f2() is Unit)
    Assert.isTrue(A().f3() is Unit)
    Assert.isTrue(MyInterface.f4() is Unit)
}