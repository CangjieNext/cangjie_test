/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_02_a03_01

  @Level:         1

  @Assertion: 9.5.2(3) In particular, when interface is used as a generic constraint, the type instantiated by the 
              generic variant when invoked must fully implement all of the interface static functions in the upper 
              bound constraint.

  @Description: Check for type fully implement all of the interface static functions.

  @Mode: run

  @Negative: no

*/

import utils.assert.Assert

interface Printable {
    static func initPrinter(): Bool
}

class C <: Printable {
    // Implemented interface static function.
    public static func initPrinter(): Bool {
        return true
    }
}

func id<T>(x: T) where T <: Printable {
    return x
}

main() {
    Assert.isTrue(id<C>(C()) is C)
}

