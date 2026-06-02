/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_04_02_a07_01

  @Level:         1

  @Assertion:    2.4.2(7) If it is a type alias for enum, it can be used as a type name of data constructor of 
                 the enum declaration.

  @Description:  Check that the enum alias can be used as a type name of data constructor of 
                 the enum declaration

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert
import utils.macros.*

type e = E

enum E { A | B | C }

main(): Unit {
    Assert.isTrue(e.A is E)
    Assert.isTrue(e.B is E)
    Assert.isTrue(e.C is E)

    @matchOrThrow[e.A](E.A)
    @matchOrThrow[e.B](E.B)
    @matchOrThrow[e.C](E.C)
}
