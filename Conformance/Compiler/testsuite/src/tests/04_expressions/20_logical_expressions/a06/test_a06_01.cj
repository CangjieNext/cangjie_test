
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_20_a06_01

  @Level:         1

  @Assertion:   4.20(6) It is used to negate its operand, i.e., the result of !false is true and the result of !true is
                false.
  @Description: Checks that the result of !false is true and the result of !true is false.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

func getTrue() { Assert.getRuntimeZero() == 0 }

func getFalse() { Assert.getRuntimeZero() != 0 }

main() {
    Assert.isTrue(!getFalse())
    Assert.isFalse(!getTrue())
}
