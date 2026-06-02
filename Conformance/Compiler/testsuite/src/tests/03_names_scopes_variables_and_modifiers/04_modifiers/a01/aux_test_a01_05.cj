/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion:   3.4 (1) Cangjie provides a number of modifiers, which fall into the following two main categories.
                    Access modifiers 
                    Non-access modifiers

  @Description: auxiliary file which contains the class for checking that members of class 
                modified with private access modifier is accessible from other package
                via getters

  @Structure:   complex-aux
*/

package aux_test_a01_05

public class AuxTestA0105 {
    private var privateVariable = 10
    private func privateMethod() {
        return 30
    }

    public func getPrivateVar() {
        return privateVariable
    }
  
    public func callPrivateMethod() {
        privateMethod()
    }
}
