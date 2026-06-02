/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_04_a09_02

  @Level:         1

  @Assertion: 6.1.4(9)
              open class C1 {
                func f(): This { // its type is `() -> C1`
                  return this
                }
                func f2() { // its type is `() -> C1`
                  return this
                }
                open func f3(): C1 {
                  return this
                }
              }
              class C2 <: C1 {
                // member function f is inherited from C1, and its type is `() -> C2` now
                override func f3(): This { // ok
                  return this
                }
              }
              var obj1: C2 = C2()
              var obj2: C1 = C2()
              var x = obj1.f() // During compilation, the type of x is C2
              var y = obj2.f() // During compilation, the type of y is C1


  @Description: Check that since y's type is C1 at compilation time
                y can not be assigned to a variable of type C2

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006301

*/

open class C1 {
    func f(): This { // its type is `() -> C1`
        return this
    }
    func f2() { // its type is `() -> C1`
        return this
    }
    open func f3(): C1 {
        return this
    }
}
class C2 <: C1 {
    // member function f is inherited from C1, and its type is `() -> C2` now
    override func f3(): This { // ok
        return this
    }
}
var obj1: C2 = C2()
var obj2: C1 = C2()
var x = obj1.f() // During compilation, the type of x is C2
var y = obj2.f() // During compilation, the type of y is C1

main() {
    var z: C2 = y
}