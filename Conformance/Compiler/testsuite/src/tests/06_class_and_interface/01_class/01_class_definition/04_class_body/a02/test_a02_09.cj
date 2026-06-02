/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_04_a02_09

  @Level:         1

  @Assertion: 6.1.1.4(2)
              A class body consists of the following parts.
              • optional static initializer
              • optional primary constructor definition
              • optional constructors definition
              • optional member variables definition
              • optional member functions and member operator functions definition or declaration
              • optional member properties definition or declaration
              • optional macro expression

  @Description: Check that a function call can not be present in the class body

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

func f(x: Int64) {
  return x
}

class A {
  f(1)
}

main() {
}
