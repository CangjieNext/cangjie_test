/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a05_02_bnot_neg_1

  @Level:         1

  @Assertion:    1.4(5) ! Logic NOT

  @Description:  Emit error with wrong not

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:


*/


main(ina :Array<String>) {
    let bt : Bool = Assert.getRuntimeZero(ina) == 0   //always true
    let cbz :Bool = false
    if (~bt) {
        1
    }
    0
}