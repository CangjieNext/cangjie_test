
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_19_a01_01

  @Level:         1

  @Assertion:   4.19(1) Range expressions are expressions that contain range operators.
  @Description: Checks compilation and execution of a program that uses range expressions. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    var counter = 0

    for (_ in 0..10) {
        counter++
    }

    Assert.equals(10, counter)

    let i = 0

    for (k in i..10) {
        counter += k
    }

    Assert.equals(55, counter)

    let j = 10

    for (_ in i..j) {
        counter++
    }

    Assert.equals(65, counter)

    counter = 0

    for (_ in 0..=9) {
        counter++
    }

    Assert.equals(10, counter)

    for (k in i..=9) {
        counter += k
    }

    Assert.equals(55, counter)

    for (_ in i..=j) {
        counter ++
    }

    Assert.equals(66, counter)

}
