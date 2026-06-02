/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a01_66

  @Level:         1

  @Assertion: 6.3.2(1)
              Class/Interface does not allow overload between static and instance member functions.
              If the names of static member functions and instance member functions
              (including those defined by the class/interface
              and inherited from super class or super interface) of a class/interface are the same,
              a compilation error is reported.

  @Description: Check that overloading between static and instance functions
                between an interface and an implementing class is not allowed.
                The function in the interface is a static generic function with a default implementation,
                the function in the class is an instance generic function

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

interface I {
    static func f<T>() {}
}

class A <: I {
    func f<T>(x: Int64) {}
}

main() {
}