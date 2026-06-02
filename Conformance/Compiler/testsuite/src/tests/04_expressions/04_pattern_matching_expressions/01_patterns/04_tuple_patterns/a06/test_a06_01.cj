/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a06_01

  @Level:         1

  @Assertion: 4.4.1.4(6) The syntax of the tuple pattern is as follows.
              tuplePattern
                  : '(' pattern (',' pattern)+ ')'
                  ;

  @Description: Checks tuple pattern positive examples.
  @Mode: run
  @Negative: no
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    Assert.isTrue(match ((1, 2)) {
        case (1, 2) => true
        case _ => false
    })

    Assert.isTrue(match ((1, 2, 3)) {
        case (1, 2, 3) => true
        case _ => false
    })

    Assert.isTrue(match ((1, 2, 3, 4)) {
        case (1, 2, 3, 4) => true
        case _ => false
    })

    Assert.isTrue(match ((1, 2)) {
        case (1, a) => true
        case _ => false
    })

    Assert.isTrue(match ((1, 2, 3)) {
        case (a, 2, 3) => true
        case _ => false
    })

    Assert.isTrue(match ((1, 2, 3, 4)) {
        case (a, b, c, d) => true
    })
    return
}
