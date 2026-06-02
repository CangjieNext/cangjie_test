/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_a01_01

  @Level:         1

  @Assertion: 9.6(1) Given a generic declaration, after all the type parameters are determined, a non-generic 
              declaration will be formed. This process is called generic instantiation.

  @Description: Check that non-generic declaration is formed after all the type parameters are determined.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface I {}

class C<T> <: I {}

main() {
    // Having all type parameters are determined, programmer can create class instances and check for hierarchy.
    let x = C<String>()
    Assert.isTrue(x is I)
}

