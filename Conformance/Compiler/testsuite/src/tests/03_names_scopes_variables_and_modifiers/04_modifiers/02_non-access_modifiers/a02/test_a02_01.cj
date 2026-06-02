/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a02_01

  @Level:         1

  @Assertion:    3.4.2(2) open indicates that the instance member can be overridden by a subclass,
                 or that the class can be inherited by a subclass, See class for details

  @Description:  Check that open modifier allows a class to be inherited and its member variables to be accessed from
                 the subclass.

  @Mode:         run

  @Negative:     no

  @Structure:    single
*/

import utils.assert.Assert

open class C1 {
    public let currentYear = 2023
    protected let currentMonth = "May"

    public var currentDay = 10
    protected var currentHour = "15:00"

    public static let E = 2.71
    protected static let PI = 3.14

    public static var isLeapYear = false
    protected static var currentSeason = "Spring"
}

class C2 <: C1 {

}

main() {
    var obj = C2()
    Assert.equals(2023, obj.currentYear)
    Assert.equals("May", obj.currentMonth)

    Assert.equals(10, obj.currentDay)
    Assert.equals("15:00", obj.currentHour)

    Assert.equals(2.71, C2.E)
    Assert.equals(3.14, C2.PI)

    Assert.equals(false, C2.isLeapYear)
    Assert.equals("Spring", C2.currentSeason)
}
