/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_04_02_a06_01

  @Level:         1

  @Assertion:    2.4.2(6) 
                    type A = B
                    class B {
                        static var b : Int32 = 0;
                        static func foo() {}
                    }
                    func foo() {
                        A.foo() // Use A to access static method in class B
                        A.b
                    }

  @Description:  Check example

  @Mode:         run

  @Negative:     no

  @Issue:        0006431

*/

import utils.assert.Assert

type A = B
class B {
    static var b : Int32 = 0;
    static func foo() {}
}
func foo() {
    A.foo() // Use A to access static method in class B
    A.b
}

main(): Unit {
    foo()
    Assert.isTrue(A.b is Int32)
    Assert.isTrue(A.foo is ()->Unit)
}
