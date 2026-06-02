/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_a02_04

  @Level:         1

  @Assertion:    3.3(2) Variables can be classified into the following types based on whether they can be modified:
                  immutable variables (whose value cannot be modified once initialized) and mutable variables
                  (whose values can be modified).

  @Description:  Check that local-level variable declared using keyword 'let' (immutable) and type can not be modified
                  after init.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    let nameVar: Rune = 'A'

    nameVar = 'B'
}
