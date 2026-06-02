/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_02_a05_04

  @Level:         1

  @Assertion: 9.2(5) RHS of <: is called upper bound. Upper bound of a constraint can be type.

  @Description: Check that upper bound in generic interface declaration being a literal causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

interface GenericInterface<T> where T <: "Not a type" {
    func hello() {
        return "Hi"
    }
}

main() {
}

