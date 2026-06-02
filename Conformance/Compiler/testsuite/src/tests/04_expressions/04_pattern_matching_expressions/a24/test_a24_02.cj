/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_a24_02

  @Level:         1

  @Assertion: 4.4(24) Similar to if expressions, the types of match expressions follow the following rules regardless
              whether they have selectors or not: When match expression is not read or returned, then the type of the
              match expression is Unit, and the branches’ types are not required to have common supertype;
  @Description: Checks that if match expression is not read or returned, its branches’ types are not required to have
                common supertype
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

var r = Assert.getRuntimeZero() + 3

enum E {A | B}

func foo() {
    r++
}

main() {

    match (r) {
        case 0 => 1
        case 1 => "2"
        case 2 => E.A
        case _ => foo()
    }

    Assert.equals(4, r);

    match {
        case r == 0 => 1
        case r == 1 => "2"
        case r == 2 => E.A
        case _ => foo()
    }

    Assert.equals(5, r);

    return
}
