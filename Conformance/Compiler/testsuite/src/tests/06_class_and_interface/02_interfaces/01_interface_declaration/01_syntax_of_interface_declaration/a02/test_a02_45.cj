/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_01_01_a02_45

  @Level:         1

  @Assertion: 6.2.1.1(2)
              An interface declaration is compared of the following elements from left to right:
              an optional modifier, the interface keyword, an interface name, an optional <:
              together with the name of the super interface, and an interface bodies enclosed with {}.

  @Description: Check that the "<:" is necessary for the supertype list

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006308

*/

interface S1 {}
interface S2 {}

interface I S1 & S2 {}

main() {
}