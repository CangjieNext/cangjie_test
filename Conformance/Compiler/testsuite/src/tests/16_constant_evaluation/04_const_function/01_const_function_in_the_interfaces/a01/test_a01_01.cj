
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_01_a01_01

  @Level:         1

  @Assertion:   16.4.1(1) 1.const function in the interface, the implementation type must also use const function to be
                considered to implement the interface.
  @Description: Check defining const function in the interface and implementing this interface.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

interface I {
    const func f(): Int64

    static const func g(): Int64
}

class C <: I {
    public const func f() { 1 }

    public static const func g() { 2 }

    const init() { }
}

main() {
    Assert.equals(1, C().f())
    Assert.equals(2, C.g())
}
