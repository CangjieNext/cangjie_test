/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a01_15

  @Level:         1

  @Assertion: 6.2.1.2(1)
              Access modifier: If no access modifier is used when defining an interface,
              then the interface can only be accessed inside the package

  @Description: Check that a generic interface with the default access modifier
                can not used as a generic constraint outside the package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a01_aux.cj

*/

import a01.*

class A<T> where T <: I2<Unit> {}

main() {
}