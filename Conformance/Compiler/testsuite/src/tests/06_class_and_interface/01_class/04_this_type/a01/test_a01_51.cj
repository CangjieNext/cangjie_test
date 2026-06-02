/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a01_51

  @Level:         1

  @Assertion: 6.1.4(1)
              Within a class, we support a This type placeholder,
              which can only be used as the return type of an instance member function
              and is replaced with the type of the class where the function is located at compile time.

  @Description: Check that This type can not be used as the type of a parameter
                in an instance generic function with the default access modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
    func f<T>(x: This) {}
}

main() {
}