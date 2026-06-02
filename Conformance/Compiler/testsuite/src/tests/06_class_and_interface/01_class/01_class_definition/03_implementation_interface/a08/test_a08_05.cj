/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_03_a08_05

  @Level:         1

  @Assertion: 6.1.1.3(8)
              When implementing a non-generic interface, it cannot be directly implemented multiple times.

  @Description: Check that a simple class can not implement a non-generic interface multiple times

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {}


class A <: I & I & I & I & I & I & I & I {}

main() {
}
