/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_06_01_a01_01

  @Level:         1

  @Assertion: 9.6.1(1)
              func show<T>(a: T) where T <: ToString {
                  a.toString()
              }

              When type argument T is given a concrete type Int32, the following non-generic function will be
              instantiated.(assume that show$Int32 is a name used by compiler internally. This convention will also be
              used in the rest of this chapter.)

              func show$Int32(a: Int32) {
                  a.toString()
              }

  @Description: Check the example provided.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

func show<T>(a: T) where T <: ToString {
    a.toString()
}

main() {
    Assert.equals("1", show<Int64>(1))
}

