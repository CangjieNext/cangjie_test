/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_01_03_a02_04

  @Level:         1

  @Assertion:     5.1.1.3(2) Interface member functions can have the following modifiers: static and mut. 
                  For details, see Interface Members.

  @Description:   Check that interface member function definition can't use function modifier private.

  @Mode:          compileonly

  @Negative:      yes

  @Structure:     single

*/

interface myInterface {
  private mut func myPrivateFunc(): Int16
}

main() {
}
