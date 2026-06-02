/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a01_27

  @Level:         1

  @Assertion: 6.1.4(1)
              Within a class, we support a This type placeholder,
              which can only be used as the return type of an instance member function
              and is replaced with the type of the class where the function is located at compile time.

  @Description: Check that This type can not be used as a type of an instance immutable variable
                of the 'protected' access level

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

class A {
    init() {
        x = this
    }

    protected let x: This
}

main() {
}