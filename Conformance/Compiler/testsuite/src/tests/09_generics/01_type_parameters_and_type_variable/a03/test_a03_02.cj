/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_01_a03_02

  @Level:         1

  @Assertion: 9.1(3) Once type parameters are declared, they can be used as a type.

  @Description: Check that type parameter usage as value causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

class GenericClass<T> {
    init(arg: T) {
        x = T
    }

    var x: T
}

main() {
}

