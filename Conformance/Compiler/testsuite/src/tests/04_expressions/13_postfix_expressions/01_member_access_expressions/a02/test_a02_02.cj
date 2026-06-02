/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a02_02

  @Level:         1

  @Assertion: 4.13.1(2) A member access expression can be used to access the members of a class,
              interface, struct, etc.

  @Description: Check that usage of member access expression to the expression without members (literal) causes
                a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

main() {
    let f = 42.foo
}

