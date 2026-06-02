/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_02_a02_02

  @Level:         1

  @Assertion: 9.5.2(2) If we want to invoke foo function defined in previous subsection with class type C:

              main(): Int64 {
                  foo<C>(C()) // error C does not implement Tr
                  return 0
              }

              Compiler will emit an error message which says type C does not implement Tr. This is because in function
              foo there are constraints T <: C & Tr and type parameter T is substituted with type argument C. C <: C
              is satisfied, while C <: Tr is not.

              For type C, if an extend declaration of Tr is added then the constraint T <: Tr is satisfied.

              extend C <: Tr {
                  func bar(): Int64 {...}
              }

  @Description: Check the part "if an extend declaration of Tr is added then the constraint T <: Tr is satisfied".

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface Tr {
    func bar(): Int64
}

open class C <: Tr {
    func coo() {}

    public func bar(): Int64 {
        return 42
    }
}

func foo<T>(a: T) where T <: C & Tr {
    var b: C = a // OK, T is a sub type of C now
    a.coo() // OK, T is a sub type of C, so it has coo member function
    a.bar() // OK, T is constrained by Tr
}

main(): Int64 { 
    Assert.equals(42, foo<C>(C()))
    return 0 
} 

