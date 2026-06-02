/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a06_01_extend_neg

  @Level:         1

  @Assertion:   10.1.1(6) In the following example, the instance member function g
                and static member function g in the extension of class A are overloaded,
                and an error will be reported during compilation.

  @Description:  Compiler emits error when overloading with instance and static member was found

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/



class A {}

    extend A {

    func g() {}

    static func g(a: Int64) {} // Error

}

main(ina :Array<String>) {
    0
}
