/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_a01_11

  @Level:         1

  @Assertion:    3.4 (1) Cangjie provides a number of modifiers, which fall into the following two main categories.
                    Access modifiers 
                    Non-access modifiers

  @Description:  Checks that method of a class with the private access modifier cannot be accessed from same 
                 package via inheritance

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

package test11

open class S {
    private func privateMethod() { }
}

class B <: S {
    func callForPrivate() { privateMethod() }
}

main() {
    B().callForPrivate()
}
