/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a03_07

  @Level:         1

  @Assertion: 6.1.1.3(3)
              Multiple interfaces are separated by &.

  @Description: Check that two interfaces can not be separated by '<'

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface i1 {}
interface i2 {}

class A <: i1 < i2 {}

main() {
}
