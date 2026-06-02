/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_01_a01_05

  @Level:         1

  @Assertion: 9.1(1) In Cangjie programming language, type parameters are represented by identifiers enclosed in <>.

  @Description: Check that type parameter enclosed in <> twice is not compiled.

  @Mode: compileonly

  @Negative: yes

*/

class GenericClass<<T>> {
}

main() {
}

