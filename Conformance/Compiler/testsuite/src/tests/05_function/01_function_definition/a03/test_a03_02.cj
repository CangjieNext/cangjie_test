/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a03_02

  @Level:         1

  @Assertion:     5.1(3) A function declaration may start with function modifiers that precede the keyword func.

  @Description:   Check that function declaration with wrong keyword as function modifier will produce error: 
                  publig instead of public.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

publig func myFunc(): String {}

main() {
}
