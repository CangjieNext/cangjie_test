/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_01_01_a08_01_enum_neg

  @Level:         1

  @Assertion:    10.1.1(8) In the following example, constructor f, instance member function f
                 and static member function f of enum E are overloaded, 
                 and an error will be reported during compilation.

  @Description:  Compiler emits error when overloading with instance and static member was found

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

*/

enum E {

    f(Int64) // constructor


    // Instance member function can not be overloaded with constructor.

    func f(a: Float64) {} // Error



    // Static member function can not be overloaded with instance member function or constructor.

    static func f(a: Bool) {} // Error

}



main(ina :Array<String>) {
    0
}
