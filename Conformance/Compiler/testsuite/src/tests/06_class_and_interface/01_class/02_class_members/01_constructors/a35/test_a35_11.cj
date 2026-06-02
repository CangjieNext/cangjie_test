/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a35_11

  @Level:         1

  @Assertion: 6.1.2.1(35)
              The constructor is specified using the init keyword and cannot contain the func keyword

  @Description: Check that a constructor can not be defined with the 'catch' keyword

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
  catch(a: Int64) {
    this.x = a
  }

  let x: Int64
}

main() {
}
