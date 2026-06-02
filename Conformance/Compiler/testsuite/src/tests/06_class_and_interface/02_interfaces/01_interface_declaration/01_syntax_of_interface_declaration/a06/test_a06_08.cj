/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a06_08

  @Level:         1

  @Assertion: 6.2.1.1(6)
              The {} enclosing the interface body can not be omitted.

  @Description: Check that the curly braces can not be omitted
                in a non-generic interface
                with a body consisting of an abstract property

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

interface I
    prop p: Int64

main() {
}