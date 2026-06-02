/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_01_a05_01

  @Level:         1

  @Assertion: 4.4.1.1(5) The following show examples of constant patterns.
              func f() {
                  let score: Int64 = 90
                  var scoreResult: String = match (score) {
                      case 0 => "zero"
                      case 10 | 20 | 30 | 40 | 50 => "fail"
                      case 70 | 80 => "good"
                      case 90 => "excellent" // matched
                      case _ => "not a valid score"
                  }
              }
  @Description: Checks compilation of an example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func f() {
    let score: Int64 = 90
    var scoreResult: String = match (score) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 70 | 80 => "good"
        case 90 => "excellent" // matched
        case _ => "not a valid score"
    }

    Assert.equals("excellent", scoreResult)
}

main() {
    f()
    return
}
