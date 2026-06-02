/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_01_02_a02_05

  @Level:         1

  @Assertion: 6.1.1.2(2)
              The superclass is declared by <: superClass after the class name.

  @Description: Check that a generic class can not use '<' for inheritance

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class A {}

class B<T> < A {}

main() {
}
