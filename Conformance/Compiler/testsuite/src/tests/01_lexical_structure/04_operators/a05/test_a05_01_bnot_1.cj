/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_04_a05_01_bnot_1

  @Level:         1

  @Assertion:    1.4(5) ! Logic NOT

  @Description:  Check lexical ability of logical not !

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:


*/

import utils.assert.Assert

main(ina :Array<String>) {
    let bt : Bool = Assert.getRuntimeZero(ina) == 0   //always true
    let cbz :Bool = false
    Assert.equals(!bt,cbz)
    if (!bt) {
        Assert.isTrue(!bt)
    }
    Assert.isTrue(!!bt)
    0
}