/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_03_04_02_a09_04

  @Level:         1
  
  @Assertion:    3.4.2(9) operator indicates that the function is an operator overload function, See Operator
                 Overloading for details

  @Description:  This file defines public struct Store.

  @Structure:    complex-aux
*/

package aux_test_a09_04

public struct AuxTestA0904 {
    public var localp = 0
    public var foreignp = 0

    public init(p: Int64) {
        localp = p
        foreignp = p + p / 10
    }

    public init(p1: Int64, p2: Int64) {
        localp = p1
        foreignp = p2
    }

    public operator func +(p: Int64): AuxTestA0904 {
        return AuxTestA0904(localp + p, foreignp + p)
    }
}
