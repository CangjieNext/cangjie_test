/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_a01_65

  @Level:         1

  @Assertion: 6.1.1(1)
              In the Cangjie programming language, a class is defined using the class keyword.

  @Description: Check that the 'where' keyword can not define a class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/


where A {
  var i = 1
  let a = 0
}

main() {
  var a : A = A()
}
