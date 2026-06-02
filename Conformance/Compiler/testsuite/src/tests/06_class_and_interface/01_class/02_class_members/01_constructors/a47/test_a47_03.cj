/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a47_03

  @Level:         1

  @Assertion: 6.1.2.1(47)
              If neither the primary constructor nor the init constructor is defined for a class,
              the compiler attempts to generate a (public modified) parameterless constructor.

  @Description: Check that a class without explicit constructor does not have
                a consctructor with one Float32 parameter

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {}

main() {
    A(.1f32)
    0
}