/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_02_a10_01

  @Level:         1

  @Assertion:    3.4.2(10) sealed means that the class or interface can only be inherited or implemented in the current
                 package, See class for details

  @Description:  Check that sealed modifier allows a class to be inherited and an interface to be implemented. When
                 class is inherited its member variables are accessible through a subclass instance.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        6084

*/

import utils.assert.Assert

sealed abstract class C1 {
    public let currentYear = 2023
    protected let currentMonth = "May"

    public var currentDay = 10
    protected var currentHour = "15:00"

    public static let E = 2.71
    protected static let PI = 3.14

    public static var isLeapYear = false
    protected static var currentSeason = "Spring"
}

sealed interface I { }

class C2 <: C1 & I { }

class G<T> <: I { }

struct S <: I { }

enum E <: I { E0 }

abstract class A <: I { }

class AA <: A { }

main() {
    var obj = C2()
    Assert.isTrue(obj is C1)
    Assert.isTrue(obj is I)
    Assert.isTrue(S() is I)
    Assert.isTrue(E.E0 is I)
    Assert.isTrue(G<Unit>() is I)
    Assert.isTrue(AA() is I)

    Assert.equals(2023, obj.currentYear)
    Assert.equals("May", obj.currentMonth)

    Assert.equals(10, obj.currentDay)
    Assert.equals("15:00", obj.currentHour)

    Assert.equals(2.71, C2.E)
    Assert.equals(3.14, C2.PI)

    Assert.equals(false, C2.isLeapYear)
    Assert.equals("Spring", C2.currentSeason)
}
