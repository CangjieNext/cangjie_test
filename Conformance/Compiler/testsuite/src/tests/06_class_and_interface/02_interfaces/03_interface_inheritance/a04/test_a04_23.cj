/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_03_a04_23

  @Level:         1

  @Assertion: 6.2.3(4)
              When inheriting a non-generic interface, it cannot be directly inherited multiple times.

  @Description: Check that a generic interface can not inherit two types
                that alias to the same interface without modifiers

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006378

*/

interface I {}

type X = I
type Y = I

interface J<T> <: X & Y {}

main() {
}