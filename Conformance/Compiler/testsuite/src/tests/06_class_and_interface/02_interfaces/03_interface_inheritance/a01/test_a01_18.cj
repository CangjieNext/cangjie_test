/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a01_18

  @Level:         1

  @Assertion: 6.2.3(1)
              An interface can inherit one or more interfaces

  @Description: Check that an interface can not inherit from the Float64 type

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I <: Float64 {}

main() {
}