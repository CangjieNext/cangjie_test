/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_02_04_a09_01

  @Level:         1
  @Assertion:    3.2.4(9) If the name f is a top-level function, f can be either overloaded based on the
                 overloading rule or shadowed.

  @Mode:         run
  @Negative:     no

*/

package test

import utils.assert.Assert

func foo () { 1 }
func foo (x: Bool) { x }
func foo (x!: Int64, y!: String) { "${x}-${y}" }

main() {
    Assert.equals(1, foo())
    Assert.equals(true, foo(true))
    Assert.equals("123-str", foo(x: 123, y: "str"))
}
