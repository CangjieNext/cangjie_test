/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_04_a07_01

  @Level:         1

  @Assertion: 4.4.1.4(7) The following is an example tuple pattern.
              let scoreTuple = ("Allen", 90)
              var scoreResult: String = match (scoreTuple) {
                  case ("Bob", 90) => "Bob got 90"
                  case ("Allen", score) => "Allen got ${score}" // matched
                  case ("Allen", 100) | ("Bob", 100) => "Allen or Bob got 100"
                  case (_, _) => ""
              }

  @Description: Checks the positive example from the spec.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let scoreTuple = ("Allen", 90)
    var scoreResult: String = match (scoreTuple) {
        case ("Bob", 90) => "Bob got 90"
        case ("Allen", score) => "Allen got ${score}" // matched
        case ("Allen", 100) | ("Bob", 100) => "Allen or Bob got 100"
        case (_, _) => ""
    }
    Assert.equals("Allen got 90", scoreResult)
    return
}
