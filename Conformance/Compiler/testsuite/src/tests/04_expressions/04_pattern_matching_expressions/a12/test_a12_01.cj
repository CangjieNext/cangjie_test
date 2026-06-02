/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a12_01

  @Level:         1

  @Assertion: 4.4(12)  The following example shows how to use the constant pattern for pattern matching.
              let score: Int64 = 90
              var scoreResult: String = match (score) {
                  case 0 => "zero"
                  case 10 | 20 | 30 | 40 | 50 => "fail"
                  case 60 => "pass"
                  case 70 | 80 => "good"
                  case 90 | 100 => "excellent" // matched
                  case _ => "not a valid score"
              }

  @Description: Checks compilation of an example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let score: Int64 = 90
    var scoreResult: String = match (score) {
        case 0 => "zero"
        case 10 | 20 | 30 | 40 | 50 => "fail"
        case 60 => "pass"
        case 70 | 80 => "good"
        case 90 | 100 => "excellent" // matched
        case _ => "not a valid score"
    }

    Assert.equals("excellent", scoreResult)
}
