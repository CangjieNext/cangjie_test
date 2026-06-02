/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a17_53

  @Level:         1

  @Assertion: 6.1.2.4(17)
              Static member functions cannot access instance member variables,
              cannot invoke instance member functions,
              and cannot reference the super or this keyword in its body.

  @Description: Check that a static generic function can not reference
                a mutable inherited instance property

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

open class A {
    mut prop p: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

class Test <: A {
    static func f<T>() {
        p
    }
}

main() {
}