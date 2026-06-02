/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a23_20

  @Level:         1

  @Assertion: 6.1.2.1(23)
              Primary constructor body: If the super class’s constructor is explicit invoked,
              calling to it must be the first expression in the primary constructor body.

  @Description: Check that the super invocation with parameters 
                can not be placed between a variable declaration and a function definition

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A {
  init(x: Int64, y: Int64) {}
}

class B <: A {
  B() {
    var x = 1
    super(1, 2)
    func f() {}    
  }
}

main() {
}