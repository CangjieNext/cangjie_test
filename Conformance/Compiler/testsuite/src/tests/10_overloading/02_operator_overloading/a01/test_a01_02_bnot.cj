/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_a01_02_bnot

  @Level:         1

  @Assertion:    10.2(1) The Cangjie programming language defines a set of operators
                 that are represented by special symbols (see Chapter 4 Expressions for all operators),
                 such as arithmetic operators (i.e., +,-,*,/,%and **),
                 logic operator (i.e., !,&&and ||), function call operator (), etc.

  @Description:  Some operators examples. Logical not

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
    0
}