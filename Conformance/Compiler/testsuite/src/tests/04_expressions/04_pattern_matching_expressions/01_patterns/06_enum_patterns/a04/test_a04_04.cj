/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a04_04

  @Level:         1

  @Assertion: 4.4.1.6(4) The following shows an example of enum pattern.
              enum TimeUnit {
                  | Year(Float32)
                  | Month(Float32, Float32)
                  | Day(Float32, Float32, Float32)
                  | Hour(Float32, Float32, Float32, Float32)
              }
              let oneYear = TimeUnit.Year(1.0)
              var howManyHours: Float32 = match (oneYear) {
                  case Year(y) => y * 365 * 24 // matched
                  case Month(y, m) => y * 365 * 24 + m * 30 * 24
                  case Day(y, m, d) => y * 365 * 24 + m * 30 * 24 + d * 24
                  case Hour(y, m, d, h) => y * 365 * 24 + m * 30 * 24 + d * 24 + h
              }

              let twoYear = TimeUnit.Year(2.0)
              var howManyYears: Float32 = match (twoYear) {
                  case Year(y) | Month(y, m) => y // error: variable cannot be introduced in patterns connected by '|'
                  case Year(y) | Month(x, _) => y // error: variable cannot be introduced in patterns connected by '|'
                  case Year(y) | Month(y, _) => y // error: variable cannot be introduced in patterns connected by '|'
                  ...
              }

  @Description: Checks that compilation of the negative example causes a compile error.
                Negative examples from spec: case 3.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no
*/

enum TimeUnit {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

main() {
    let twoYear = TimeUnit.Year(2.0)
    var howManyYears: Float32 = match (twoYear) {
        case Year(y) | Month(y, _) => y // error: variable cannot be introduced in patterns connected by '|'
    }

    return
}
