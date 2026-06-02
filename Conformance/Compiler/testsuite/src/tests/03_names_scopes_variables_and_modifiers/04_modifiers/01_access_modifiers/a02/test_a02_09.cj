/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_01_a02_09

  @Level:         1

  @Assertion:    3.4.1(2) Cangjie supports 4 different kinds of access rights.

  @Description:  Checks that member of a class with the private access modifier cannot be accessed from other package

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a02_09.cj

*/

package test09

import aux_test_a02_09.*

main() {
    AuxTestA0209().privateVar = 0
}
