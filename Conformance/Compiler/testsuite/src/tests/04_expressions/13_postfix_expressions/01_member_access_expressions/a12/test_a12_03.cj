/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a12_03

  @Level:         1

  @Assertion: 4.13.1(12) When e is an expression (assuming the type of e is T), we have the following rules.

              2. When T is a value type, e.a is mutable if e mutable and a is a mutable instance member variable of T,
                 otherwise e.a is immutable.

  @Description: Check that 'e.a' is immutable for value type of 'e' when 'e' is mutable and 'a' is an immutable
                instance member variable.

  @Mode: compileonly

  @Negative: yes

*/

struct S {
    S(let x!: Int64) {}
}

main() {
    var s = S(x: 3)
    s.x = 5
}

