/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a01_41

  @Level:         1

  @Assertion: 6.2.1.1(1)
              Interfaces are declared with the interface keyword.

  @Description: Check that the 'quote' keyword can not define an interface

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/


quote A {
    func f(): Unit
}

main() {
}
