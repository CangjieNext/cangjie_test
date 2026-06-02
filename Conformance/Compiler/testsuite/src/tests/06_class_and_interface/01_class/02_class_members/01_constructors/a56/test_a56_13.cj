/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a56_13

  @Level:         1

  @Assertion: 6.1.2.1(56)
              Calling instance member functions or properties is forbidden in constructors of open classes.

  @Description: Check that a protected instance inhertited generic function can not be called
                in a constructor of an open class

  @Mode: compileonly

  @Negative: yes

  @Structure: single

*/

open class B {
    protected func f<T1, T2>() {
        return 1
    }
}

open class A <: B {
    init() {
        super.f<Rune, Bool>()
    }
}

main() {
}