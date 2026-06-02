/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_02_a01_01

  @Level:         1

  @Assertion:       4.4.2(1) A pattern is said to be refutable when it is possible for the pattern not to match the
                    value it is intended to match.

  @Description:     Check that some pattern can be refutable. For example, a constant pattern.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    let v = 0

    // Constant pattern '0' can match the value:
    match(v) {
        case 0 => Assert.isTrue(true)
        case _ => Assert.fail()
    }

    // and can not match the value (constant pattern '1'):
    match(v) {
        case 1 => Assert.fail()
        case _ => Assert.isTrue(true)
    }
}
