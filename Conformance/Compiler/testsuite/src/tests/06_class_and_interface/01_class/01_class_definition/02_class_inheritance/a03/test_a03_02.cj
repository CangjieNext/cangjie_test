/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a03_02

  @Level:         1

  @Assertion: 6.1.1.2(3)
              Note that the superclass must be a different class.

  @Description: Check that an open class can not inherit itself

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A <: A {}

main() {
}
