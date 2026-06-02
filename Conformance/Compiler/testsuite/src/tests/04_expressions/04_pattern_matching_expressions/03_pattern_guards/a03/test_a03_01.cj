/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_03_a03_01

  @Level:         1

  @Assertion:       4.4.3(3) In the match expression, pattern guards are supported to provide a powerful and flexible
                    matching mechanism, i.e., adding an expression of Boolean type where boolExpression between pattern
                    and =>.

  @Description:     Check that adding `where boolExpression` between a pattern and `=>` works as expected.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    let boolExpression = true
    match (0) {
        case pattern where boolExpression => Assert.equals(0, pattern)
        case _ => Assert.fail()
    }
}
