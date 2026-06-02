/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_06_a01_01

  @Level:         1

  @Assertion: 4.4.1.6(1) Enum patterns are often used together with enum types.

  @Description: Checks that enum patterns matches some of the examples of an enum.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

enum E1 {
    A | B
}

enum E2 {
    | I(Int64)
    | F(Float64)
}

enum E3<T> {
    | X1(T)
    | X2(T)
}

main() {
    var v1: E1 = A
    Assert.isTrue(match(v1) {
        case A => true
        case B => false
    })

    var v2: E1 = B
    Assert.isTrue(match(v2) {
        case A => false
        case B => true
    })

    var v3: E2 = I(10i64)
    Assert.isTrue(match(v3) {
        case I(x) => true
        case F(x) => false
    })

    var v4: E2 = F(10.5)
    Assert.isTrue(match(v4) {
        case I(x) => false
        case F(x) => true
    })

    var v5: E3<Rune> = X1<Rune>(r'a')
    Assert.isTrue(match(v5) {
        case X1(x) => true
        case X2(x) => false
    })

    var v6: E3<Rune> = X2<Rune>(r'a')
    Assert.isTrue(match(v6) {
        case X1(x) => false
        case X2(x) => true
    })

    return
}
