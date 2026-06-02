/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_01_a02_06

  @Level:         1

  @Assertion: 9.1(2) Multiple type parameters are separated using comma , in <>, e.g., <T1, T2, T3>, T1, T2, and T3 
              are all type parameters.

  @Description: Check that type parameters separated by identifier causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class GenericClass2<T1 and T2> {
}

main() {
}

