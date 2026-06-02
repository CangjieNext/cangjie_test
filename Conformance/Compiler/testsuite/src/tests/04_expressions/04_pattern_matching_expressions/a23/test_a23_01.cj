/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a23_01

  @Level:         1

  @Assertion: 4.4(23)
              let score = 80
              var result: String = match {
                  case score < 60 => "fail"
                  case score < 70 => "pass"
                  case score < 90 => "good" // matched
                  case _ => "excellent"
              }

  @Description: Checks the compilations of the example.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

main() {
    let score = 80
    var result: String = match {
        case score < 60 => "fail"
        case score < 70 => "pass"
        case score < 90 => "good" // matched
        case _ => "excellent"
    }

    Assert.equals("good", result)
}
