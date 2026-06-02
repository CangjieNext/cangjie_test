/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_03_04_02_a05_03

  @Level:         1
  
  @Assertion:    3.4.2(5) static means that the member is a static member, and static members cannot be accessed
                 through instance objects, See class for details

  @Description:  This file defines public class C1.

  @Structure:    complex-aux
*/

package aux_test_a05_03

public open class AuxTestA0503 {
    public static func foo<T>(p: T) {
        return p
    }
}
