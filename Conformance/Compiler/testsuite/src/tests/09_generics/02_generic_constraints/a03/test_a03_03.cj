/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a03_03

  @Level:         1

  @Assertion: 9.2(3) Generic constraints are declared with <: operator after where keyword.

  @Description: Checks that <: operator absence in interface declaration causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

open class Animal {}

interface GenericInterface<T> where T Animal {
    func isAnimal(x: T) {
        return x is Animal
    }
}

main() {
}

