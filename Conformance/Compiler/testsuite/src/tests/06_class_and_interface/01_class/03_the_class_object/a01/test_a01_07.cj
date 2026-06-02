/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_03_a01_07

  @Level:         1

  @Assertion: 6.1.3(1)
              The class Object is the superclass of all other classes (interfaces are not included),
              and the class Object does not contain any members, i.e. Object is an “empty” class

  @Description: Check that Iterable interface is not a subtype of Object

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class ObjectTester<T> where T <: Object {}

main() {
    let tst = ObjectTester<Iterable<Int64>>()
}