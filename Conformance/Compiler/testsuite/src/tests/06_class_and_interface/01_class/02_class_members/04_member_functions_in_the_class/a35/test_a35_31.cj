/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a35_31

  @Level:         1

  @Assertion: 6.1.2.4(35)
              If there are open-modified members in the class, but the current class is not open-modified,
              then these open-modified members still have no open effect,
              and the compiler will report a warning for this case
              (no warning is required for inherited open members or override members).
              The compiler will report a warning for this case.

  @Description: Check that a protected open function with parameters and with the Unit return type
                that overrides a function from a sealed class
                produces a compiler warning if it's in a non-inheritable class

  @Mode: run

  @Negative: no

  @Structure: single

  @CompileWarning: no

  @Issue: 0006270, 0006084

*/

import utils.assert.Assert

sealed abstract class A {
    open protected func f(x: String) {
        Assert.isTrue(false)
    }
}

class Test <: A {
    open protected func f(x: String) {}
}

main() {
    Assert.isTrue(Test().f("") is Unit)
}