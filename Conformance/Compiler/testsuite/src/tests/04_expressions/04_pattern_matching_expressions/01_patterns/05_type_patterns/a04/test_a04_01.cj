/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_05_a04_01

  @Level:         1

  @Assertion: 4.4.1.5(4) Afterwards, the variable is bound with the varBindingPattern on the left of : (no bound exists
              for wildcardPattern : type).

  @Description: Checks that the variable which is bound with the varBindingPattern is accessible like in the
                binding pattern.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/
import utils.assert.Assert

main() {
    var v = 123
    Assert.equals(124, match (v) {
        case foo: Int64 => foo + 1
        case _ => 0
    })
    return
}
