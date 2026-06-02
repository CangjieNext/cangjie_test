/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_01_a12_20

  @Level:         1

  @Assertion: 6.1.1.1(12)
              A non-abstract subclass of an abstract class must implement all abstract functions in its superclass.

  @Description: Check that a simple class must implement an abstract function of its generic superclass
                even if it defines another function with the same name and different return type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

abstract class A<T> {
  public func foo(x: Int64): Unit
}

class B <: A<Bool> {
  public func foo(x: Int64) {
    return 1
  }
}

main() {
}
