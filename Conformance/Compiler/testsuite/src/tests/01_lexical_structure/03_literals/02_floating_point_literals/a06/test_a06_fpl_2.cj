/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_03_02_a06_fpl_2

  @Level:         1

  @Assertion:    1.3.2(6) The syntax of floating point literals is:

  @Description:  Check syntax of float numbers, emit syntax error

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/
main() {
    0xA.BP+10 // Hexadecimalprefix   HexadecimalDigits HexadecimalFraction   HexadecimalExponent
}
