/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a35_20

  @Level:         1

  @Assertion: 6.1.2.4(35)
              If there are open-modified members in the class, but the current class is not open-modified,
              then these open-modified members still have no open effect,
              and the compiler will report a warning for this case
              (no warning is required for inherited open members or override members).
              The compiler will report a warning for this case.

  @Description: Check that a public open function without parameters and with a non-Unit return type
                that overrides a function from an abstract class
                produces a compiler warning if it's in a non-inheritable class

  @Mode: run

  @Negative: no

  @Structure: single

  @CompileWarning: no

  @Issue: 0006270

*/

import utils.assert.Assert

abstract class A {
    open public func f() {
        return '0'
    }
}

class Test <: A {
    open public func f() {
        return 's'
    }
}

main() {
    Assert.equals('s', Test().f())
}