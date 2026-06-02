/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         aux_03_04_02_a03_02

  @Level:         1
  
  @Assertion:    3.4.2(3) override means overriding a member of the parent class, See class for details

  @Description:  This file defines public open class C1.

  @Structure:    complex-aux
*/

package aux_test_a03_02

public interface I {
    func foo1(): String

    func foo2() {
        return 'I'
    }
}

public open class C1 {
  open public func foo3(): Int64 {
    return 1999
  }

  open public func foo4() {
    return 19.99
  }
}