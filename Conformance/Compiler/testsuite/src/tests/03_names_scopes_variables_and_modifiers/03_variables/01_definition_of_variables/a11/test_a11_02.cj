/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a11_02

  @Level:         1

  @Assertion:    3.3.1(11) The new variables introduced in the pattern after let (or var) are all let-modified 
                 (or var-modified) variables.

  @Description:  Check that variable introduced in let-modified tuple pattern is immutable.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

main() {
    let (eee, fff): (Int64, Rune) = (12, 'W')
    fff = 'a'
}