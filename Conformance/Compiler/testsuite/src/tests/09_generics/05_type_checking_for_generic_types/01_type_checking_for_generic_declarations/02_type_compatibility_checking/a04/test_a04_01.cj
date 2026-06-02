/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_01_02_a04_01

  @Level:         1

  @Assertion: 9.5.1.2(4) 
              open class C {
                  func coo() {...}
              }

              interface Tr {
                  func bar(): Int64
              }

              func foo<T>(a: T) where T <: C & Tr {
                  var b: C = a // OK, T is a sub type of C now
                  a.coo() // OK, T is a sub type of C, so it has coo member function
                  a.bar() // OK, T is constrained by Tr
              }

  @Description: Check the example provided.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

open class C {
    func coo() {}
}

interface Tr {
    func bar(): Int64
}

func foo<T>(a: T) where T <: C & Tr {
    var b: C = a // OK, T is a sub type of C now
    a.coo() // OK, T is a sub type of C, so it has coo member function
    a.bar() // OK, T is constrained by Tr
}

class D <: C & Tr {
    public func bar(): Int64 {
        return 42
    }
}

main() {
    Assert.equals(42, foo<D>(D()))
}

