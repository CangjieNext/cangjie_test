/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a02_18

  @Level:         1

  @Assertion: 6.2.1.1(2)
              An interface declaration is compared of the following elements from left to right:
              an optional modifier, the interface keyword, an interface name, an optional <:
              together with the name of the super interface, and an interface bodies enclosed with {}.

  @Description: Check that an interface with generic parameters and constraints
                can not omit the name

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006308

*/

interface<T> where T <: Rune {
    func f(): Unit
}

main() {
}