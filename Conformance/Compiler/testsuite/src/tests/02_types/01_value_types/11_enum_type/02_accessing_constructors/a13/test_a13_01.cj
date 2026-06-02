/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            02_01_11_02_a13_01

  @Level:         1

  @Assertion:       2.1.11.2(13) The enum constructor, when used with the type prefix omitted, 
  can declare generic parameters of type enum after the constructor name.

  @Description:     Checks that generic parameter of enum can be placed after plain constructor

  @Mode:            run
  @Negative:        no
  @Structure:       single

  @Comment:

*/
import utils.assert.Assert

enum TimeUnit3<T1, T2> {
    | Year
    | Month(T1)
    | Day(T1, T2, T2)
    | Hour(T1, T2, T2, T2)
}

let t1 = Day<String, Bool>("1.0", true, false)
var t2 = Year<Rune, Unit>
let t3 = Month<TimeUnit3<String, Bool>, (ToString, Comparable<Int16>)>(t1)

main() {
    Assert.isTrue(t1 is TimeUnit3<String, Bool>)
    Assert.isTrue(t2 is TimeUnit3<Rune, Unit>)
    Assert.isTrue(t3 is TimeUnit3<TimeUnit3<String, Bool>, (ToString, Comparable<Int16>)>)
}
