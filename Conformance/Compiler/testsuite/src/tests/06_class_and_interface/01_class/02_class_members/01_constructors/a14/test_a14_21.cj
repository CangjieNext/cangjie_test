/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a14_21

  @Level:         1

  @Assertion: 6.1.2.1(14)
              The members in the primary constructor can also be modified by using private, public, and protected.

  @Description: Check that a let member variable unnamed parameter in the primary constructor
                modified with 'private' creates a variable that is not visible in a subclass

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class Test {
  Test(private let x: Int64) {}
}

class A <: Test {
  A() {
    super(0)
  }

  func check() {
    let tmp = x
  }
}

main() {
  let tst = A()
  tst.check()
}