/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_03_a01_01

  @Level:         1

  @Assertion: 9.6.3(1) 
              struct instantiation is similar with class. 

              struct Foo<T> {
                  func foo(a: T) {...}
              }

              When T = Int32, the following instantiated declaration will be generated:

              struct Foo$Int32 {
                  func foo(a: Int32) {...}
              }

  @Description: Check the instantiation for example provided.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

struct Foo<T> {
    func foo(a: T) {
        return a
    }
}

main() {
    let f = Foo<Int32>()
    Assert.equals(42, f.foo(42))
    Assert.isTrue(f.foo is (Int32) -> Int32)
}

