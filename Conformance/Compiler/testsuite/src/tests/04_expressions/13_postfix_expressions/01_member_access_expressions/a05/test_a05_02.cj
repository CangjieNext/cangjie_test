/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_13_01_a05_02

  @Level:         1

  @Assertion: 4.13.1(5) If T is an instance of struct, accessing to non-static members of struct by instance name
              is allowed.

  @Description: Check that usage of 'T.a' expression where 'T' is a name of struct instance and 'a' is a static
                member causes a compilation error.

  @Mode: compileonly

  @Negative: yes

*/

struct S {
    S(var x!: Int64) {}

    static func foo() {
        return 6
    }
}

main() {
    let s = S(x: 42)
    let f = s.foo
}

