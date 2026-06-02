/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a25_01

  @Level:         1

  @Assertion: 6.1.2.4(25)
              class C<T> {
                static func foo<U>(a: U, b: T): U { a }
              }
              var a: Bool = C<Int32>.foo<Bool>(true, 1)
              var b: String = C<Bool>.foo<String>("hello", false)
              func f<V>(a: V): V { C<Int32>.foo<V>(a, 0) }

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class C<T> {
    static func foo<U>(a: U, b: T): U { a }
}
var a: Bool = C<Int32>.foo<Bool>(true, 1)
var b: String = C<Bool>.foo<String>("hello", false)
func f<V>(a: V): V { C<Int32>.foo<V>(a, 0) }

main() {
    Assert.equals(true, a)
    Assert.equals("hello", b)
    Assert.equals(12, f<Int64>(12))
}