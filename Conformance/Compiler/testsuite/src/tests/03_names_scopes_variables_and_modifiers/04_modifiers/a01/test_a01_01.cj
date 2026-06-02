/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_a01_01

  @Level:         1

  @Assertion:    3.4 (1) Cangjie provides a number of modifiers, which fall into the following two main categories.
                    Access modifiers 
                    Non-access modifiers 

  @Description:  Checks that a class with an open modifier can be inherited

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

open class A {
    func method() { return true }
}

class B <: A {}

main() {
    Assert.isTrue(B().method())
}
