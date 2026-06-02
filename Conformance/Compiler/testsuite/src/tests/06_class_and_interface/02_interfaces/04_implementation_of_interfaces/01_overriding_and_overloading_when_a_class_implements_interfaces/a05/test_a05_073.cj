/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a05_073

  @Level:         1

  @Assertion: 6.2.4.1(5)
              If there is any generic function in the interface,
              the constraints of the type parameters of the implemented function
              must be looser than or the same as the corresponding function in the interface.

  @Description: Check that a struct while implementing a generic function from a superinterface
                can not change a class-relevant upper bound to a class-irrelevant type
                while using the 'redef' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class C {}

interface I {
    static func f<T>(): Unit where T <: C
}

struct A <: I {
    public redef static func f<T>() where T <: Bool {}
}

main() {
}