/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_03_a05_01

  @Level:         1

  @Assertion: 4.4.1.3(5) The following illustrates how binding patterns are used.
              let score: Int64 = 90
              var scoreResult: String = match (score) {
                  case 60 => "pass"
                  case 70 | 80 => "good"
                  case 90 | 100 => "excellent" // matched
                  case failScore => // binding pattern
                  let passNeed = 60 - failScore
                  "failed with ${failScore}, and ${passNeed} need to pass"
                  case noScore => "Didn't take the exam" // binding pattern
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
        case 60 => "pass"
        case 70 | 80 => "good"
        case 90 | 100 => "excellent" // matched
        case failScore => // binding pattern
            let passNeed = 60 - failScore
            "failed with ${failScore}, and ${passNeed} need to pass"
        case noScore => "Didn't take the exam" // binding pattern
    }
    Assert.equals("excellent", scoreResult)
    return
}
