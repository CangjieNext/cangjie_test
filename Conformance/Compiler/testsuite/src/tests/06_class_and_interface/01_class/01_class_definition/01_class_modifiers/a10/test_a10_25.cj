/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a10_25

  @Level:         1

  @Assertion: 6.1.1.1(10)
              An abstract class cannot be instantiated.

  @Description: Check that a generic public abstract class with abstract functions can not be instantiated

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

public abstract class TestA1025<T, U> {
  func foo() {
    return 1
  }
  public func bar(x: Int32): Int32
}

main() {
  var x = TestA1025<Bool, Bool>()
}
