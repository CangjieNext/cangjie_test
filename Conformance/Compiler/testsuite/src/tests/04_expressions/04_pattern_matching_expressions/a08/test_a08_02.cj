/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a08_02

  @Level:         1

  @Assertion: 4.4(8) Within {} after selector, a number of matchCases can be defined, each starting with the keyword
              case, followed by a pattern or a sequence of patterns of the same kind separated by | (see the Patterns
              section for detailed definitions of different pattern) an optional pattern guard, a double arrow => and a
              series of (at least one) declarations or expressions (multiple declarations or expressions are separated
              by semicolons or newline characters)
  @Description: Checks match exression with a sequence of patterns of the same kind separated by |.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var expr = Assert.getRuntimeZero()

main() {
    var m = match (expr) {
        case 0 | 1 | 2 => "succeed"
        case _ => "fail"
    }
    Assert.equals("succeed", m);

    return
}
