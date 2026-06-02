/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_19

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the
              value of an expression is called the evaluation of the expression.
  @Description: Checks that logical expressions have type and value.
                Tests logic NOT (!), logic AND (&&) and logic OR (||).
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

main() {
    var v_true = true
    var v_false = false
    Assert.isTrue(!v_true is Bool)
    Assert.isTrue(!v_false)

    Assert.isTrue((v_true && v_true) is Bool)
    Assert.isTrue(v_true && v_true)

    Assert.isTrue((v_false || v_true) is Bool)
    Assert.isTrue(v_false || v_true)
}
