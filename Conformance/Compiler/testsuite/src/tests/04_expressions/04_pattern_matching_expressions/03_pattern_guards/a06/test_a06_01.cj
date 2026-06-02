/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            04_04_03_a06_01

  @Level:         1

  @Assertion:       4.4.3(6) The following shows an example pattern guard.
                    let oneYear = Year(1.0)
                    var howManyHours: Float32 = match (oneYear) {
                        case Year(y) where y > 0 => y * 365 * 24 // matched
                        case Year(y) where y <= 0 => 0.0
                        case Month(y, m) where y > 0 && m > 0 => y * 365 * 24 + m * 30 * 24
                        case Day(y, m, d) where y > 0 && m > 0 && d > 0 => y * 365 * 24 + m * 30 * 24 + d * 24
                        case Hour(y, m, d, h) where y > 0 && m > 0 && d > 0 && h > 0 => y * 365 * 24 + m * 30 * 24 +
                                                                                        d * 24 + h
                        case _ => 0.0
                    }

  @Description:     Check that the pattern guard example works.

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @CompileWarning:  ignore

  @Issue:           0006483
*/

import utils.assert.Assert

enum TimeUnit2 {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

main() {
    let oneYear = Year(1.0)
    var howManyHours: Float32 = match (oneYear) {
        case Year(y) where y > 0.0 => y * 365.0 * 24.0 // matched
        case Year(y) where y <= 0.0 => 0.0
        case Month(y, m) where y > 0.0 && m > 0.0 => y * 365.0 * 24.0 + m * 30.0 * 24.0
        case Day(y, m, d) where y > 0.0 && m > 0.0 && d > 0.0 => y * 365.0 * 24.0 + m * 30.0 * 24.0 + d * 24.0
        case Hour(y, m, d, h) where y > 0.0 && m > 0.0 && d > 0.0 && h > 0.0 => y * 365.0 * 24.0 + m * 30.0 * 24.0 + d * 24.0 + h
        case _ => 0.0
    }
    Assert.equals(8760.0, howManyHours)
}
