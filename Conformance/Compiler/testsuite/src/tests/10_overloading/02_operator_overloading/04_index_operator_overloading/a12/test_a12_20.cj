/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      10_02_04_a12_20

  @Level:         1

  @Assertion: 10.2.4(12)
              In particular, Numeric type, Bool, Unit, Nothing, Rune, String, Range, Function, Enum, Tuple type do not
              support the overloaded index operator assignment form. 

  @Description: Check that String type supports the overloaded index operator get form.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

main() {
    var s: String = "hello"
    Assert.equals(b'e', s[1])
}


