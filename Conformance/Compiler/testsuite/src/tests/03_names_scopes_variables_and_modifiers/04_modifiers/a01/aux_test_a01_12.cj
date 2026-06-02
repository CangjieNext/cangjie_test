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

  @Description: auxiliary file which contains the struct for checking that method of class 
                modified with private access modifier is inaccessible from other package
                via inheritance

  @Structure:   complex-aux
*/

package aux_test_a01_12

open public class AuxTestA0112 {
    private func privateMethod() { }
}