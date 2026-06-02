/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a61_01

  @Level:         1

  @Assertion: 6.1.2.1(61)
              var b: Int64 = 1
              class A {
                  var a: Int64 = 1
                  var b: ()->Int64 = { 3 } // OK

                  /* Cannot use lambda which captured `this` before all of the instance member
                  variables are initialized. */
                  var c: ()->Int64 = { a } // Error

                  /* Cannot use function which captured `this` before all of the instance member
                  variables are initialized. */
                  var d: ()->Int64 = f // Error

                  var e: Int64 = a + 1 // OK
                
                  func f(): Int64 {
                      return a
                  }
              }

              class B {
                  var a: Int64 = 1
                  var b: ()->Int64

                  init() {
                      b = { 3 }
                  }

                  init(p: Int64) {
                      this()
                      b = { this.a } // OK
                      b = f // OK
                  }

                  func f(): Int64 {
                      return a
                  }
              }

              var globalVar: C = C()
              open class C {
                  init() {
                      globalVar = this // Error, `this` cannot escape out of constructors of `open` class
                      f(this) // Error, `this` cannot escape out of constructors of `open` class
                      m() // Error: calling instance function is forbidden in constructors of `open` class
                  }

                  func m() {}
              }

  @Description: Check that the example without erroneous lines works correctly

  @Mode: run

  @Negative: no

  @Structure: single

  @Issue: 0006229
*/

import utils.assert.Assert

var b: Int64 = 1
class A {
    var a: Int64 = 1
    var b: ()->Int64 = { => 3 } // OK

    var e: Int64 = a + 1 // OK

    func f(): Int64 {
        return a
    }
}

class B {
    var a: Int64 = 1
    var b: ()->Int64

    init() {
        b = { => 3 }
    }

    init(p: Int64) {
        this()
        b = { => this.a } // OK
        b = f // OK
    }

    func f(): Int64 {
        return a
    }
}

var globalVar: C = C()
open class C {
    init() {
    }

    func m() {}
}

main() {
    let case1 = A()
    Assert.equals(1, case1.a)
    Assert.equals(3, case1.b())
    Assert.equals(2, case1.e)
    Assert.equals(1, case1.f())

    let case2 = B()
    Assert.equals(1, case2.a)
    Assert.equals(3, case2.b())
    Assert.equals(1, case2.f())

    let case3 = B(1)
    Assert.equals(1, case3.a)
    Assert.equals(1, case3.b())
    Assert.equals(1, case3.f())

    let case4 = C()
    Assert.isTrue(case4 is C)
}