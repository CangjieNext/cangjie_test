/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_01_a14_01

  @Level:         1
  @Assertion:       2.1.11.1(14) enums can not be inherited.

  @Description:     Checks that enums can not be inherited.

  @Mode:            compileonly
  @Negative:        yes
  @Structure:       single

  @Comment:

*/

enum A { A1 }

enum B <: A { B1 }

main() {
}
