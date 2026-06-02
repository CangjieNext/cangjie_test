
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a09_01

  @Level:         1

  @Assertion:   16.1(9) const variables can be global variables, local variables, static member variables, and instance
                member variables.
  @Description: Checks that const variables can be global variables, local variables, static member variables, and
                instance member variables.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

class C {
    static const s = 0

    const init() { }
}

const g = 2

main() {
    const l = 3
    
    Assert.equals(0, C.s)
    Assert.equals(2, g)
    Assert.equals(3, l)
}
