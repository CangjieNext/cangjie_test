/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a10_02

  @Level:         1

  @Assertion: 4.13.1(10) When e is a type name, we have the following rules. e.a is mutable when a is
              a mutable static member variable of e, otherwise e.a is immutable.

  @Description: Check that 'e.a' is immutable when 'e' is a class type name and 'a' is an immutable static member
                variable.

  @Mode: compileonly

  @Negative: yes

*/

class C {
    static let x: Int64 = 1
}

main() {
    C.x = 3
}

