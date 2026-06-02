/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a01_01

  @Level:         1

  @Assertion: 4.2(1) The variable name and the function name themselves
              (including variables or functions referred to by package
              names) are also expressions.
  @Description: Checks that variable names are expressions.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

let l1 = 1
var v1 = "Hello World"

main() {
    let l2: Float64
    var v2: Array<Int64>

    let l3 = (1, 2, 3, 4, 5)
    var v3 = v1

    l2 = 3.2345
    v2 = [Assert.getRuntimeZero()]

    l1
    l2
    l3

    v1
    v2
    v3

    return
}
