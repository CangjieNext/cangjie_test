/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_02_a06_25

  @Level:         1

  @Assertion: 6.2.1.2(6)
              You can also use the sealed modifier to indicate that the interface can be inherited,
              implemented, or extended only in the package which the interface is defined.

  @Description: Check that a generic sealed interface modified with 'public'
                can not be implemented by a struct through extension outside the package

  @Mode: compileonly

  @Negative: yes

  @Structure: complex-main

  @Dependencies: a06_aux.cj

  @Issue: 0006084, 0006345

*/

import a06.*

struct A {}
extend A <: I4<Unit> {}

main() {
}