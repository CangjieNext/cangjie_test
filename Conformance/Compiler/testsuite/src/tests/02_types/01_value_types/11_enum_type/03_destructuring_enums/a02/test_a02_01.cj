/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:           02_01_11_03_a02_01

  @Level:         1

  @Assertion:      2.1.11.3(2) Take the TimeUnit1 and TimeUnit2 as defined in above as examples, 
  their deconstruction can be illustrated as follows:
 let time12 = TimeUnit1.Year
 let howManyHours = match (time12) {
  case Year => 365 * 24 // matched
  case Month => 30 * 24
  case Day => 24
  case Hour => 1
 }
 
 let time13 = TimeUnit2.Month(1.0, 1.5)
 let howManyHours = match (time13) {
  case Year(y) => y * 365 * 24
  case Month(y, m) => y * 365 * 24 + m * 30 * 24 // matched
  case Day(y, m, d) => y * 365 * 24 + m * 30 * 24 + d * 24
  case Hour(y, m, d, h) => y * 365 * 24 + m * 30 * 24 + d * 24 + h
 }

  @Description:     Checks that positive examples behave as expected

  @Mode:            run
  @Negative:        no
  @Structure:       single
  @Issue:           6445

  @Comment:
*/
import utils.assert.Assert

enum TimeUnit1 {
    Year | Month | Day | Hour
}

enum TimeUnit2 {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
 }
main() {
    let time12 = TimeUnit1.Year
    let howManyHours1 = match (time12) {
        case Year => 365.0f32 * 24.0f32 // matched
        case Month => 30.0f32 * 24.0f32
        case Day => 24.0f32
        case Hour => 1.0f32
    }
 
    let time13 = TimeUnit2.Month(1.0, 1.5)
    let howManyHours2 = match (time13) {
        case Year(y) => y * 365.0f32 * 24.0f32
        case Month(y, m) => y * 365.0f32 * 24.0f32 + m * 30.0f32 * 24.0f32 // matched
        case Day(y, m, d) => y * 365.0f32 * 24.0f32 + m * 30.0f32 * 24.0f32 + d * 24.0f32
        case Hour(y, m, d, h) => y * 365.0f32 * 24.0f32 + m * 30.0f32 * 24.0f32 + d * 24.0f32 + h
    }
}
