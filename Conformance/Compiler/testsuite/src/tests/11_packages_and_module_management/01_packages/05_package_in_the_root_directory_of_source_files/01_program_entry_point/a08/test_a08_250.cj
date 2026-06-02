/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        11_01_05_01_a08_250

  @Level:         1

  @Assertion:   11.1.5.1(8) If a unique main method is found, the compiler will 
                further check its parameter and return value type. The main can have
                no parameter or parameter of type Array<String> and return value of type
                Unit or integer.

  @Description: Check that main method cannot have parameter of type Array<Rune>.

  @Mode:        compileonly

  @Negative:    yes

  @Structure:   single

  @Comment:     Auto-generated test by neg_gen_bad_param.py

*/

main(p1: Array<Rune>) {
    var i : UInt16 = 0
    return i
}

