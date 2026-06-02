/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a12_11

  @Level:         1

  @Assertion: 6.1.1.1(12)
              A non-abstract subclass of an abstract class must implement all abstract functions in its superclass.

  @Description: Check that a generic class can't partially implement abstract functions of its superclass

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A {
  public func foo(): Unit
  public func fooo(): Unit
  public func foooo(): Unit
}

class B<a, b, c> <: A {
  public func foo() {}
  public func fooo() {}
}

main() {
}
