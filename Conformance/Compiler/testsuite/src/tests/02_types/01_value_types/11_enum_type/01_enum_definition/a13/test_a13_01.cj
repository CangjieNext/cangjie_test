/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_01_a13_01

  @Level:         1
  @Assertion:       2.1.11.1(13) For example:
 // recursive enum
 enum TimeUnit5 {
  | Year(Int32)
  | Month(Int32, Float32)
  | Day(Int32, Float32, Float32)
  | Hour(Int32, Float32, Float32, Float32)
  | Twounit(TimeUnit5, TimeUnit5)
 }
 // mutually recursive enums
 enum E1 {
  A | B(E2)
 }
 enum E2 {
  C(E1) | D(E1)
 }
 
  @Description:     Checks that positive examples compile

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single

  @Comment:

*/

enum TimeUnit5 {
    | Year(Int32)
    | Month(Int32, Float32)
    | Day(Int32, Float32, Float32)
    | Hour(Int32, Float32, Float32, Float32)
    | Twounit(TimeUnit5, TimeUnit5)
}

enum E1 {
    A | B(E2)
}
enum E2 {
    C(E1) | D(E1)
}

main() {
}
