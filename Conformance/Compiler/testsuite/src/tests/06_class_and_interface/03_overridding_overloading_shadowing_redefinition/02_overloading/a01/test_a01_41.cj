/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_03_02_a01_41

  @Level:         1

  @Assertion: 6.3.2(1)
              Class/Interface does not allow overload between static and instance member functions.
              If the names of static member functions and instance member functions
              (including those defined by the class/interface
              and inherited from super class or super interface) of a class/interface are the same,
              a compilation error is reported.

  @Description: Check that overloading between static and instance functions
                inside a single class is not allowed.
                One function is an instance generic function,
                another one is a generic static function

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
    func f<T>() {}
    static func f<T>(x: Int64) {}
}

main() {
}