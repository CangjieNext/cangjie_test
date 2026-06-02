
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a09_01

  @Level:         1

  @Assertion:   16.4(9) 6.const functions are not always executed at compile time; for example, they can be called at
                runtime in non-const functions.
  @Description: Checks calling const functions in non-const functions at runtime.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func f() { 2 }

struct S {
    let v: Int64

    static const func sf() { 3 }

    const func mf() { 4 }

    const init() { v = 5 }
}

func g() {
    const l = {x: S => 1}
    Assert.equals(1, l(S()))
    Assert.equals(2, f())
    Assert.equals(3, S.sf())
    Assert.equals(4, S().mf())
    Assert.equals(5, S().v)
}

main() {
    g()
}
