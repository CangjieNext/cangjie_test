/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_03_04_02_a02_05

  @Level:         1
  
  @Assertion:    3.4.2(2) open indicates that the instance member can be overridden by a subclass,
                 or that the class can be inherited by a subclass, See class for details

  @Description:  This file defines public open class C1.

  @Structure:    complex-aux
*/

package aux_test_a02_05

public open class AuxTestA0205 {
    public let currentYear = "2023"

    public var currentDay = 10

    public static let E = 2.71

    public static var isLeapYear = false
}
