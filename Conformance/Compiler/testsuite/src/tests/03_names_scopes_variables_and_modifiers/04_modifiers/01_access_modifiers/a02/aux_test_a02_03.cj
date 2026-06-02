/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   3.4.1(2) Cangjie supports 4 different kinds of access rights.

  @Description: auxiliary file which contains the class for checking that members of class 
                modified with private access modifier is accessible from other package
                via getters

  @Structure:   complex-aux
*/

package aux_test_a02_03

public class AuxTestA0203 {
    private var privateVariable = 2
    private func privateMethod() { return 3 }

    public func getPrivateVar() { return privateVariable }
    public func callPrivateMethod() { privateMethod() }
}
