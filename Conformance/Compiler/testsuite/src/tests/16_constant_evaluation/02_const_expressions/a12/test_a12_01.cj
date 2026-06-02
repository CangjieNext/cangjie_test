
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Comment:     This assertion is a part of the list with the heading
                "The following expressions are all const expressions"
  @Name:     16_02_a12_01

  @Level:         1

  @Assertion:   16.2(12) 9.member access of const expressions (excluding access of properties), access of elements for
                tuples.
  @Description: Check that member access of const expressions and access of elements for tuples are const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

struct S {
    static const x = 0
    var v = 1
    let l = 2

    const init() {

    }

    const func f() { 1 }
}

main() {
    const s = S()
    const c1 = S.x
    const c2 = s.v
    const c3 = s.l
    const c4 = s.f
    const t = (c1, c2, c3, c4)
    const c5 = t[0]
    Assert.equals(0, c1)
    Assert.equals(1, c2)
    Assert.equals(2, c3)
    Assert.equals(1, c4())
    Assert.equals(0, c5)
    return 0
}
