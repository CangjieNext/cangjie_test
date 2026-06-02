/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_03_04_02_a04_02

  @Level:         1
  
  @Assertion:    3.4.2(4) redef means redefine the static members of the parent class, See class for details

  @Description:  This file defines public open class C1 and interface I.

  @Structure:    complex-aux
*/

package aux_test_a04_02

public interface I {
    static func foo1() {
        return "foo1"
    }
}

public open class C1 {
    public static func foo2() {
        return "foo2"
    }
}
