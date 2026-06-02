/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_01_a02_14

  @Level:         1

  @Assertion:    3.4.1(2) Cangjie supports 4 different kinds of access rights.

  @Description:  Checks that method of a class with the private access modifier cannot be accessed 
                 from same package via inheritance

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

package test14

open class A {
    private func privateMethod() { }
}

class B <: A {
    func callForPrivate() { privateMethod() }
}

main() {
    B().callForPrivate()
}
