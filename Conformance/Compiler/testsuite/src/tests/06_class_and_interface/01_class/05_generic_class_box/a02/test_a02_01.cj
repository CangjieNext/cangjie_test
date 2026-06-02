/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_05_a02_01

  @Level:         1

  @Assertion: 6.1.5(2)
              The class is defined as follows.
              It has a unique variable value declared by var and a unique constructor function init.
              The parameter type of the constructor function is T.
              class Box<T> {
                var value: T
                init(value: T) {
                  this.value = value
                }
              }

  @Description: Check that the Box class have a constructor with one parameter and a mutable instance variable 'value'

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006302

*/

import utils.assert.Assert

main() {
    let tst1 = Box<Int64>(1)
    Assert.isTrue(tst1.value is Int64)
    Assert.equals(1, tst1.value)
    tst1.value = 2
    Assert.equals(2, tst1.value)

    let tst2 = Box<String>("")
    Assert.isTrue(tst2.value is String)
    Assert.equals("", tst2.value)
    tst2.value = "ffff"
    Assert.equals("ffff", tst2.value)

    let tst3 = Box<Rune>(r'g')
    Assert.isTrue(tst3.value is Rune)
    Assert.equals(r'g', tst3.value)
    tst3.value = r'v'
    Assert.equals(r'v', tst3.value)

    let tst4 = Box<Array<Int64>>([0, 9, 8])
    Assert.isTrue(tst4.value is Array<Int64>)
    Assert.equals([0, 9, 8], tst4.value)
    tst4.value = [2]
    Assert.equals([2], tst4.value)

    let tst5 = Box<Range<Int64>>(-9..9:-1)
    Assert.isTrue(tst5.value is Range<Int64>)
    Assert.equals(-9..9:-1, tst5.value)
    tst5.value = 1..1:1
    Assert.equals(1..1:1, tst5.value)
}
