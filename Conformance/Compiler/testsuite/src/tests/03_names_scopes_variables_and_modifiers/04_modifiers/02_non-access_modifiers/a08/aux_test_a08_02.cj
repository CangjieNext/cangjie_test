/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_03_04_02_a08_02

  @Level:         1
  
  @Assertion:    3.4.2(8) mut indicates that the member is of mutable semantics, See function for details

  @Description:  This file defines public structs S1, S2 and public interface I.

  @Structure:    complex-aux
*/

package aux_test_a08_02

public struct S1 {
    public var a = 1

    public mut func double() {
        this.a *= 2
    } 
}

public interface I {
    mut func setDate(): Unit
}

public struct S2 <: I {
    public var currentYear = 0

    public mut func setDate() {
        currentYear = 2023
    }
}
