/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a04_10

  @Level:         1

  @Assertion: 6.1.2(4)
              A instance member is a member that can be accessed through an object
              only after the class object is instantiated.

  @Description: Check that a private instance function can not be accessed
                through the class name without instantiating the class object

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  private func f() {
    return -1
  }
  
  func check() {
    let b = A.f()
  }
}

main() {
}