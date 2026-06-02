/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a09_02

  @Level:         1

  @Assertion:    3.3.1(9) let (or var) can can only be followed by patterns that must or may be irrefutable 
                 (see Classification of Patterns).

  @Description:  Check that we can define variables using patterns which can be irrefutable: tuple, enum.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

enum Color {
    Red(Int64)
}

main() {
    let (x,y) = ("JHFJ",45.2)
    let Red(a) = Red(22)
}