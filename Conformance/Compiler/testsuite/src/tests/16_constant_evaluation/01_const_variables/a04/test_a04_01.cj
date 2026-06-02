
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        16_01_a04_01

  @Level:         1

  @Assertion:   16.1(4) As with let/var, const variables also support omitted types.
  @Description: Checks that const variables support omitted types.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

class C {
    static const s : Rune = r'1'
    static const m = false

    const init() { }
}

const g = "1"

main() {
    const l = 1

    Assert.isTrue(l is Int64)
    Assert.isTrue(g is String)
    Assert.isTrue(C.s is Rune)
    Assert.isTrue(C.m is Bool)
}
