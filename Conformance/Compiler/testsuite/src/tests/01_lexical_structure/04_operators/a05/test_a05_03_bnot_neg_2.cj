/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a05_03_bnot_neg_2

  @Level:         1

  @Assertion:    1.4(5) ! Logic NOT

  @Description:  Emit error with non bool type

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:


*/


main(ina :Array<String>) {
    let bt : Bool = true
    let cbz :Bool = false
    !0.1
    0
}
