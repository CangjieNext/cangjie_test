/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a19_01

  @Level:         1

  @Assertion:    3.3.1(19) The type of the pattern needs to match the type after the colon.

  @Description:  Check that variables can be defined and initialized according defined types

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

type MyTupleType = (Rune, String, Int32)

public let (x, y): (Int8, Float16) = (12, 90.2)

main() {
    var myVar: Int32
    let (a, b, c): MyTupleType = (r'F', "SAFASDF", 20)
    Assert.equals(r'F', a)
    Assert.isTrue(a is Rune)
    Assert.equals("SAFASDF", b)
    Assert.isTrue(b is String)
    Assert.equals(20, c)
    Assert.isTrue(c is Int32)

    Assert.equals(12, x)
    Assert.isTrue(x is Int8)
    Assert.equals(90.2, y)
    Assert.isTrue(y is Float16)

    myVar = 6
    Assert.isTrue(myVar is Int32)
}
