/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a23_08

  @Level:         1

  @Assertion: 6.1.2.1(23)
              Primary constructor body: If the super class’s constructor is explicit invoked,
              calling to it must be the first expression in the primary constructor body.

  @Description: Check that the super invocation without parameters 
                can not be placed after several elements of the body

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A {
  init() {}
}

class B <: A {
  B() {
    var x = 1
    func f() {}
    x = x + 1
    super()
  }
}

main() {
}