/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 09_05_02_a03_02

  @Level:         1

  @Assertion: 9.5.2(3) In particular, when interface is used as a generic constraint, the type instantiated by the 
              generic variant when invoked must fully implement all of the interface static functions in the upper 
              bound constraint.

  @Description: Check that type substitution which does not implement interface static function causes a compilation
                error.

  @Mode: compileonly

  @Negative: yes

*/

interface Printable {
    // Interface static function which is not implemented in implementation.
    static func initPrinter(): Bool
}

abstract class C <: Printable {}

func id<T>(x: T) where T <: Printable {
    return x
}

main() {
    id<C>(C())
    return
}

