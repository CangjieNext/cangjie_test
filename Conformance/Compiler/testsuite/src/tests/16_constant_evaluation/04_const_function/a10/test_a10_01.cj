
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     16_04_a10_01

  @Level:         1

  @Assertion:   16.4(10) 7.The rules for overloading const functions and non-const functions are the same.
  @Description: Checks const function overloading.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no
  @Issue: 6614

*/

import utils.assert.Assert

const func f() { 1 }

const func f(x: Int64) { x }

func f(x : String) { x }

struct S {
    static const func sf() { 2 }

    static const func sf(x: Int64) { x }

    static func sf(x: String) { x }

    const func mf() { 3 }

    const func mf(x: Int64) { x }

    func mf(x: String) { x }

    const init() { }
}

func g() {
    Assert.equals(1, f())
    Assert.equals("1", f("1"))
    Assert.equals(11, f(11))
    Assert.equals(2, S.sf())
    Assert.equals("2", S.sf("2"))
    Assert.equals(22, S.sf(22))
    Assert.equals(3, S().mf())
    Assert.equals("3", S().mf("3"))
    Assert.equals(33, S().mf(33))
}

main() {
    g()
}
