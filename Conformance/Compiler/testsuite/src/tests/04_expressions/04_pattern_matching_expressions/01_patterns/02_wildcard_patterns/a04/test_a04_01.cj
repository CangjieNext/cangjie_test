/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_02_a04_01

  @Level:         1

  @Assertion: 4.4.1.2(4) The following is an example of the wildcard pattern:
              let score: Int64 = 90
              var scoreResult: String = match (score) {
                  case 60 => "pass"
                  case 70 | 80 => "good"
                  case 90 | 100 => "excellent" // matched
                  case _ => "fail" // wildcard pattern: used for default case
              }

  @Description: Checks the positive example above from the specification.
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
        case _ => "fail" // wildcard pattern: used for default case
    }
    Assert.equals("excellent", scoreResult)
}
