/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_04_a22_01

  @Level:         1

  @Assertion: 6.1.2.4(22)
              For example:
              class C<T> {
                static let a: Int32 = 0
                  static func foo(b: T): Int32 {
                return a
                }
              }
              main(): Int64 {
                print("${C<Int32>.foo(3)}")
                print("${C<Bool>.foo(true)}")
                return 0
              }
              This program has their own static member variable a
              and static function foo for C<Int32> and C<Bool> respectively.

  @Description: Check that the example works correctly

  @Mode: run

  @Negative: no

  @Structure: single

*/

import utils.assert.Assert

class C<T> {
    static let a: Int32 = 0
    static func foo(b: T): Int32 {
        return a
    }
}

main(): Int64 {
    print("${C<Int32>.foo(3)}")
    print("${C<Bool>.foo(true)}")
    Assert.equals("0", "${C<Int32>.foo(3)}")
    Assert.equals("0", "${C<Bool>.foo(true)}")
    return 0
}