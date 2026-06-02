/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a08_01

  @Level:         1

  @Assertion: 4.4.1.6(8)
              enum TimeUnit {
                  | Year(Float32)
                  | Month(Float32, Float32)
                  | Day(Float32, Float32, Float32)
                  | Hour(Float32, Float32, Float32, Float32)
              }

              let oneYear = TimeUnit.Year(1.0)
              var howManyHours: Float32 = match (oneYear) { // error: match must be exhaustive
                  case Year(y) => y * 365 * 24
                  case Month(y, m) => y * 365 * 24 + m * 30 * 24
              }

  @Description: Checks that compilation of the negative example causes a compile error.
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
    let oneYear = TimeUnit.Year(1.0)
    var howManyHours: Float32 = match (oneYear) { // error: match must be exhaustive
        case Year(y) => y * 365 * 24
        case Month(y, m) => y * 365 * 24 + m * 30 * 24
    }
    return
}
