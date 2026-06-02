/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a09_02

  @Level:         1

  @Assertion: 4.2(9)  For example:

    func identity<T>(a: T) {     // identity is a generic function 
        return a
    }

    var b = identity // error: generic function 'identity' needs type arguments
    var c = identity<Int32> // ok: Int32 is given as a type argument

    identity is a generic function, so identity is not a legal expression itself.
    identity<Int32> is a legal expression since all type arguments are given.

  @Description: Checks Example from the Spec: positive case, 'identity<Int32>'
                is a legal expression.

  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func identity<T>(a: T) {     // identity is a generic function 
    return a
}
var c = identity<Int32> // ok: Int32 is given as a type argument

main() {
    Assert.isTrue(c is (Int32) -> Int32)
    var res = c(1)
    Assert.isTrue(res is Int32)
    Assert.equals(1, res)
    return
}