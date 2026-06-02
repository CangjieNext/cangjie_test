/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:             02_01_11_02_a03_01

  @Level:         1

  @Assertion:        2.1.11.2(3) Note that since Cangjie supports type inference for generic parameters, 
  the generic parameter <T> can be omitted when accessed using both way 1 and way 2 above

  @Description:     Checks that generic parameter of enum can be inferred

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

let time5 = Day("1.0", true, false)
let time6 = TimeUnit3.Day(1, 2.0, 3.0)

main() {
    Assert.isTrue(time5 is TimeUnit3<String, Bool>)
    Assert.isTrue(time6 is TimeUnit3<Int64, Float64>)
    var t2 = Hour(time5, (1,2), (2,3), (3,4))
    Assert.isTrue(t2 is TimeUnit3<TimeUnit3<String, Bool>, (Int64, Int64)>)
}
