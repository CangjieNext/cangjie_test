/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_22

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that assignment expressions have type and value.
                Tests operators: '=', '+=', '-=', '**=', '*=', '/=', '%=', '&&=',
                '||=', '&=', '|=', '^=', '<<=', '>>='.
  @Mode: run
  @Negative: no
  @Structure: single
*/

import utils.assert.Assert

main() {
    var i: Int64
    var b: Bool

    let unit1 = (i = 5)
    Assert.equals(5, i)
    Assert.isTrue(unit1 is Unit)
    if(() != unit1) { 
        Assert.fail(reason: "Unit1 should have value ()") 
    }

    let unit2 = (i += 1)
    Assert.equals(6, i)
    Assert.isTrue(unit2 is Unit)
    if(() != unit2) { 
        Assert.fail(reason: "Unit2 should have value ()") 
    }

    let unit3 = (i -= 3)
    Assert.equals(3, i)
    Assert.isTrue(unit3 is Unit)
    if(() != unit2) {
        Assert.fail(reason: "Unit3 should have value ()") 
    }

    let unit4 = (i **= 2)
    Assert.equals(9, i)
    Assert.isTrue(unit4 is Unit)
    if(() != unit4) { 
        Assert.fail(reason: "Unit4 should have value ()") 
    }

    let unit5 = (i *= 2)
    Assert.equals(18, i)
    Assert.isTrue(unit5 is Unit)
    if(() != unit5) {
        Assert.fail(reason: "Unit5 should have value ()") 
    }

    let unit6 = (i /= 3)
    Assert.equals(6, i)
    Assert.isTrue(unit6 is Unit)
    if(() != unit6) {
        Assert.fail(reason: "Unit6 should have value ()") 
    }

    let unit7 = (i %= 5)
    Assert.equals(1, i)
    Assert.isTrue(unit7 is Unit)
    if(() != unit7) {
        Assert.fail(reason: "Unit7 should have value ()") 
    }

    let unit8 = (i %= 5)
    Assert.equals(1, i)
    Assert.isTrue(unit7 is Unit)
    if(() != unit8) { 
        Assert.fail(reason: "Unit8 should have value ()") 
    }

    let unit9 = (b = false)
    Assert.isTrue(unit9 is Unit)
    Assert.isFalse(b)
    if(() != unit9) {
        Assert.fail(reason: "Unit9 should have value ()") 
    }

    let unit10 = (b ||= true)
    Assert.isTrue(unit10 is Unit)
    Assert.isTrue(b)
    if(() != unit10) { 
        Assert.fail(reason: "Unit10 should have value ()") 
    }

    let unit11 = (b &&= false)
    Assert.isTrue(unit11 is Unit)
    Assert.isFalse(b)
    if(() != unit11) {
        Assert.fail(reason: "Unit11 should have value ()") 
    }

    let unit12 = (i &= 123456)
    Assert.isTrue(unit12 is Unit)
    Assert.equals(0, i)
    if(() != unit12) { 
        Assert.fail(reason: "Unit12 should have value ()") 
    }

    let unit13 = (i &= 123456)
    Assert.isTrue(unit13 is Unit)
    Assert.equals(0, i)
    if(() != unit13) { 
        Assert.fail(reason: "Unit13 should have value ()") 
    }

    let unit14 = (i |= 789012)
    Assert.isTrue(unit14 is Unit)
    Assert.equals(789012, i)
    if(() != unit14) {
        Assert.fail(reason: "Unit14 should have value ()") 
    }

    let unit15 = (i ^= 10)
    Assert.isTrue(unit15 is Unit)
    Assert.equals(789022, i)
    if(() != unit15) {
        Assert.fail(reason: "Unit15 should have value ()") 
    }

    let unit16 = (i <<= 10)
    Assert.isTrue(unit16 is Unit)
    Assert.equals(807958528, i)
    if(() != unit16) {
        Assert.fail(reason: "Unit16 should have value ()") 
    }

    let unit17 = (i >>= 10)
    Assert.isTrue(unit17 is Unit)
    Assert.equals(789022, i)
    if(() != unit17) {
        Assert.fail(reason: "Unit1 should have value ()") 
    }
}

