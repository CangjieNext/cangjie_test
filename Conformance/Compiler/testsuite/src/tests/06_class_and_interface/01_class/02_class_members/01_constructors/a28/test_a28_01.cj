/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a28_01

  @Level:         1

  @Assertion: 6.1.2.1(28)
              When defining a primary constructor,
              regular parameters cannot be followed by member variable parameters

  @Description: Check that in the primary constructor parameter list
                regular parameters can be followed by member variable parameters

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006195

  @Comment: This assertion is clearly incorrect. It contradicts the syntax definition,
            the description of parameters and even the example in the next assertion

*/

import utils.assert.Assert

// Regular unnamed parameters, member variable named parameters, member variable named parameters
class A {
  A(p1: Int64, p2: Int64, public let p3: Int64, private var p4!: Int64) {
    Assert.equals(1, p1)
    Assert.equals(2, p2)
    Assert.equals(3, p3)
    Assert.equals(4, p4)
  }
}

// Regular unnamed paramters, regular named parameters, member variable named parameters
open class B {
  B(p1: Int64, p2!: Int64, public let p3!: Int64) {
    Assert.equals(1, p1)
    Assert.equals(2, p2)
    Assert.equals(3, p3)
  }
}

// Regular unnamed parameters, regular named parameters
public class TestA2801 {
  TestA2801(p1: Int64, p2: Int64, p3!: Int64) {
    Assert.equals(1, p1)
    Assert.equals(2, p2)
    Assert.equals(3, p3)
  }
}

main() {
  let case1 = A(1, 2, 3, p4: 4)

  let case2 = B(1, p2: 2, p3: 3)

  let case3 = TestA2801(1, 2, p3: 3)
}