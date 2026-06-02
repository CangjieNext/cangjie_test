/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_02_04_01_a07_034

  @Level:         1

  @Assertion: 6.2.4.1(7)
              The type of the implemented property must be the same as the corresponding property in the interface.

  @Description: Check that a class can not change a type of
                an abstract mutable static property with a default implementation
                to Nothing

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

interface I {
    static mut prop p: Int64 {
        get() {
            1
        }
        set(v) {}
    }
}

class A <: I {
    public static mut prop p: Nothing {
        get() {
        }
        set(v) {}
    }
}

main() {
}