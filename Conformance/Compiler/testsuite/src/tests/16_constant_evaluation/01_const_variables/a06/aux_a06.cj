/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Structure:    complex-aux
*/

package p

import utils.assert.Assert

public const c4 = 4
public const c21 : Int64 = 21

public open class AuxA06 {
    static const c5 = 5
    static const c6 : Int64 = 6
    public static const c17 = 17
    public static const c18: Int64 = 18
    protected static const c19 = 19
    protected static const c20: Int64 = 20

    static const c7 = 7
    static const c8: Int64 = 8
    public static const c9 = 9
    public static const c10: Int64 = 10
    protected static const c11 = 11
    protected static const c12: Int64 = 12

    public const init() { }
}

public func check() {
    let c = AuxA06()
    Assert.equals(5, AuxA06.c5)
    Assert.equals(6, AuxA06.c6)
    Assert.equals(7, AuxA06.c7)
    Assert.equals(8, AuxA06.c8)
}
