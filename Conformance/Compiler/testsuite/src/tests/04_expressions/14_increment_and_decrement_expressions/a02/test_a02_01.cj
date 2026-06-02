/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_14_a02_01

  @Level:         1

  @Assertion: 4.14(2) a++ and a-- are syntactic sugar of a+=1 and a-=1 respectively.

  @Description: Check that 'a++' expression is equivalent to 'a+=1' and that 'a--' expression is equivalent to 'a-=1'.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    //
    // Case: a++
    //

    var p1 = 0
    var p2 = 0

    p1++
    p2 += 1
    Assert.equals(p1, p2)

    p1++
    p2 += 1
    Assert.equals(p1, p2)

    p1++
    p2 += 1
    Assert.equals(p1, p2)

    Assert.isTrue(p1++ is Unit)
    Assert.isTrue((p2 += 1) is Unit)

    //
    // Case: a--
    //

    var m1 = 100
    var m2 = 100

    m1--
    m2 -= 1
    Assert.equals(m1, m2)

    m1--
    m2 -= 1
    Assert.equals(m1, m2)

    m1--
    m2 -= 1
    Assert.equals(m1, m2)

    Assert.isTrue(m1++ is Unit)
    Assert.isTrue((m2 += 1) is Unit)
}

