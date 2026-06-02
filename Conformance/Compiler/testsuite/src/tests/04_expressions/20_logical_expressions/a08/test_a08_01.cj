
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a08_01

  @Level:         1

  @Assertion:   4.20(8) For the expression expr1 && expr2, its value is equal to true only if both expr1 and expr2 are
                equal to true.
  @Description: Checks the semantics of the && operator.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

main() {
    Assert.isTrue(true && true)
    Assert.isFalse(true && false)
    Assert.isFalse(false && true)
    Assert.isFalse(false && false)
}
