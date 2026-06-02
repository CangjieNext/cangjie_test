/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a07_192

  @Level:         1

  @Assertion: 6.2.4.1(7)
              The type of the implemented property must be the same as the corresponding property in the interface.

  @Description: Check that an enum can not change a type of
                an abstract mutable static property with a default implementation
                to a type that is a supertype of the original type
                while using the 'redef' modifier

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

open class Sup {}
class Sub <: Sup {}

interface I {
    static mut prop p: Sub {
        get() {
            Sub()
        }
        set(v) {}
    }
}

enum A <: I {
    E
    public redef static mut prop p: Sup {
        get() {
            Sub()
        }
        set(v) {}
    }
}

main() {
}