/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a37_01

  @Level:         1

  @Assertion: 6.1.2.1(37)
              You can add an access modifier before init to restrict the access scope of the constructor.

  @Description: Check that different access modifiers can be applied to an init constructor

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006084

*/

import utils.assert.Assert

var init_id = 0

class A {
  init() {
    init_id = 1
  }

  public init(a: Int64) {
    init_id = 2
  }

  protected init(a: String) {
    init_id = 3
  }

  private init(a: Bool) {
    init_id = 4
  }

  static func test() {
    let case1 = A()
    Assert.equals(1, init_id)

    let case2 = A(10)
    Assert.equals(2, init_id)

    let case3 = A("")
    Assert.equals(3, init_id)

    let case4 = A(true)
    Assert.equals(4, init_id)
  }  
}

public class B {
  init() {
    init_id = 5
  }

  public init(a: Int64) {
    init_id = 6
  }

  protected init(a: String) {
    init_id = 7
  }

  private init(a: Bool) {
    init_id = 8
  }

  static func test() {
    let case1 = B()
    Assert.equals(5, init_id)

    let case2 = B(10)
    Assert.equals(6, init_id)

    let case3 = B("")
    Assert.equals(7, init_id)

    let case4 = B(true)
    Assert.equals(8, init_id)
  }
}

class C {
  init() {
    init_id = 9
  }

  public init(a: Int64) {
    init_id = 10
  }

  protected init(a: String) {
    init_id = 11
  }

  private init(a: Bool) {
    init_id = 12
  }

  static func test() {
    let case1 = C()
    Assert.equals(9, init_id)

    let case2 = C(10)
    Assert.equals(10, init_id)

    let case3 = C("")
    Assert.equals(11, init_id)

    let case4 = C(true)
    Assert.equals(12, init_id)
  }
}

public abstract class D {
  init() {
    init_id = 13
  }

  public init(a: Int64) {
    init_id = 14
  }

  protected init(a: String) {
    init_id = 15
  }

  // No way to call this one
  // but at least check that it compiles
  private init(a: Bool) {
    init_id = 16
  }
}

class E <: D {
  init() {
    super()
    Assert.equals(13, init_id)
    init_id = 17
  }

  public init(a: Int64) {
    super(a)
    Assert.equals(14, init_id)
    init_id = 18
  }

  protected init(a: String) {
    super(a)
    Assert.equals(15, init_id)
    init_id = 19
  }

  private init(a: Bool) {
    super()
    Assert.equals(13, init_id)
    init_id = 20
  }

  static func test() {
    let case1 = E()
    Assert.equals(17, init_id)

    let case2 = E(10)
    Assert.equals(18, init_id)

    let case3 = E("")
    Assert.equals(19, init_id)

    let case4 = E(true)
    Assert.equals(20, init_id)
  }
}

main() {
  A.test()
  B.test()
  C.test()
  E.test()
}
