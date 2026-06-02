/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a58_22

  @Level:         1

  @Assertion: 6.1.2.1(58)
              Before all of the instance member variables are initialized,
              the constructor cannot use functions or lambda that capture this
              or use super functions by super.f or use separate this expression,
              but can use this.variableName (the syntax sugar variableName)
              to access initialized member variables.

  @Description: Check that an inherited instance member function without modifiers
                can not be used inside a constructor before initialization
                of all member variables

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006226, 0006194

*/

open class A {
    func f() {}
}

class Test <: A {
    init() {
        super.f()
        m = 1
    }

    public var m: Int64
}

main() {
}