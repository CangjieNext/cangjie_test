/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_a01_10

  @Level:         1

  @Assertion: 6.1.2(1)
              A class consists of the following members:
              • members inherited from its superclass (if there is);
              • members of the interfaces that are implemented by the class, if there are;
              • members declared or defined in the class, including static initializer, primary constructor, 
                init constructors, static member variables, instance member variables, static member functions, 
                instance member functions, static member properties or instance member properties.

  @Description: Check that properties of the class that is not inherited by a class
                are not members of that class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

open class NotAParent {
  prop p: Int64 {
    get() {
      1
    }
  }
}

class A {}

main() {
  let a = A()
  a.p
}
