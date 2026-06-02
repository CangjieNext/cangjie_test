
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Comment:     This assertion is a part of the list with the heading
                "The following expressions are all const expressions."
  @Name:     16_02_a05_01

  @Level:         1

  @Assertion:   16.2(5) 3.const variables, parameters of const functions, local variables in const functions.
  @Description: Checks that const variables, parameters of const functions and local variables in const functions are
                const expressions.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func f(x: Int64) {
    let c1 = x
    let v: Int64 = 2
    let c2 = v
    let l = 3
    let c3 = l
    return (c1, c2, c3)
}

main() {
    const c4 = 4
    const c5 = c4
    const temp = 1
    const c6 = f(temp)

    Assert.equals(4, c4)
    Assert.equals(4, c5)
    Assert.isTrue((1, 2, 3) == c6)
}
