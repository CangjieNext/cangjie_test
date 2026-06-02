/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a56_54

  @Level:         1

  @Assertion: 6.1.2.1(56)
              Calling instance member functions or properties is forbidden in constructors of open classes.

  @Description: Check that a protected inherited instance mutable property
                can not be called in a constructor of an abstract class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006124

*/

open class B {
    protected mut prop p: Int64 {
        get() {
            10
        }
        set(v) {}
    }
}

abstract class A <: B {
    init() {
        super.p
    }
}

main() {
}