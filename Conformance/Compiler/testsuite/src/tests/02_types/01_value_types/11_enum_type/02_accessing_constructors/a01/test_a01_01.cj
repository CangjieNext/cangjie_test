/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:             02_01_11_02_a01_01

  @Level:         1

  @Assertion:        2.1.11.2(1) The first manner is access a constructor through the enum name and 
  the constructor name, for example:
 let time1 = TimeUnit1.Year
 let time2 = TimeUnit2.Month(1.0, 2.0)
 let time3 = TimeUnit3<Int64, Float64>.Day(1, 2.0, 3.0)
 
  @Description:     Checks that positive examples compile

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single

  @Comment:

*/

enum TimeUnit1 {
    Year | Month | Day | Hour
}
enum TimeUnit2 {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}
 
enum TimeUnit3<T1, T2> {
    | Year(T1)
    | Month(T1, T2)
    | Day(T1, T2, T2)
    | Hour(T1, T2, T2, T2)
}
let time1 = TimeUnit1.Year
let time2 = TimeUnit2.Month(1.0, 2.0)
let time3 = TimeUnit3<Int64, Float64>.Day(1, 2.0, 3.0)

main() {
}
