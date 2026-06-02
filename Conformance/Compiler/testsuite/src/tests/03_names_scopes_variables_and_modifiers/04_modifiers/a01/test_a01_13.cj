/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_a01_13

  @Level:         1

  @Assertion:    3.4 (1) Cangjie provides a number of modifiers, which fall into the following two main categories.
                    Access modifiers 
                    Non-access modifiers

  @Description:  Checks that member of a class with the private access modifier cannot be accessed from 
                 the other package via inheritance

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    complex-main

  @Dependencies: aux_test_a01_13.cj

*/

package test13

import aux_test_a01_13.*

class B <: AuxTestA0113 {
    func callForPrivate() { privateVar = 0 }
}

main() {
    B().callForPrivate()
}
