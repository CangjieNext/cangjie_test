/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_02_a03_01

  @Level:         1

  @Assertion: 9.5.1.2(3) If we want the program to pass type checker, constraints can be added at the place just in 
              the front of function body.

  @Description: Check added constraint for the generic type.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

class A {}

func id<T>(x: T): A where T<: A {
    return x
}

main() {
    Assert.isTrue(id<A>(A()) is A)
}

