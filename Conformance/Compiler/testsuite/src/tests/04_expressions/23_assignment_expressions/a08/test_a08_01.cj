
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_23_a08_01

  @Level:         1

  @Assertion:   4.23(8) An optional ? operator can be existed between leftAuxExpression and assignableSuffix, which is
                the syntactic sugar for assigning values to instances of option types
  @Description: Checks assignments to values of Option type with ? operator.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: ignore

*/

import utils.assert.Assert

class C {
    var x = 0
}

main() {
    var x = Some([1, 2, 3])
    x?[0] = 5
    Assert.equals(5, x.getOrThrow()[0])

    x = None
    x?[0] = 6
    Assert.equals(7, x?[0] ?? 7)

    var y = Some(C())
    y?.x = 5
    Assert.equals(5, y.getOrThrow().x)

    y = None
    y?.x = 6
    Assert.equals(7, y?.x ?? 7)
}
