/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_01_a04_01

  @Level:         1
  @Assertion:       2.1.11.1(4)  Examples of enum definition:
/*
Define an enum type 'TimeUnit1' who has four constructors: 'Year', 'Month', 'Day' and 'Hour'.
*/
enum TimeUnit1 {
  Year | Month | Day | Hour
}
 
 /*
 'TimeUnit2' has four constructors: 'Year(Int32)', 'Month(Int32, Float32)', 
 'Day(Int32, Float32, Float32)' and 'Hour(Int32, Float32, Float32, Float32)'.
 */
 enum TimeUnit2 {
  | Year(Float32)
  | Month(Float32, Float32)
  | Day(Float32, Float32, Float32)
  | Hour(Float32, Float32, Float32, Float32)
 }
 
 /*
 Define a generic enum type 'TimeUnit3<T1, T2>' who has four constructors: 
 'Year(T1)', 'Month(T1, T2)', 'Day(T1, T2, T2)' and 'Hour(T1, T2, T2, T2)'.
 */
 enum TimeUnit3<T1, T2> {
  | Year(T1)
  | Month(T1, T2)
  | Day(T1, T2, T2)
  | Hour(T1, T2, T2, T2)
 }

  @Description:     Checks that examples do compile

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

main() {
}
