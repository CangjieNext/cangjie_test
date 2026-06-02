/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_03_a04_01

  @Level:         1

  @Assertion:       4.4.3(4) If a pattern guard is present, a match is successful if and only if the value is matched
                    with the pattern and the boolExpression is true.

  @Description:     Check that the code after '=>' is executed if the selector matches and the boolExpression is true.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  no

*/

import utils.assert.Assert

main() {
    let boolExpression = true
    Assert.isTrue(match (0) {
        case 0 where boolExpression => true
        case _ => false
    })
}
