/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a01_27

  @Level:         1

  @Assertion: 6.2.3(1)
              An interface can inherit one or more interfaces

  @Description: Check that an interface can not inherit from a varray type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006077

*/

interface I <: VArray<Int64, $10> {}

main() {
}