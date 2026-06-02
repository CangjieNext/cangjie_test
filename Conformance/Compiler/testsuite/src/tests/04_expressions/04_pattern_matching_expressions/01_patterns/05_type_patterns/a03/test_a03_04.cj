/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_05_a03_04

  @Level:         1

  @Assertion: 4.4.1.5(3) For the type pattern varBindingPattern: type (or wildcardPattern : type). A type pattern
              is successfully matched only if the variable to be matched is of type type or its subtype.
              In the latter case, the variable is casted into type type.

  @Description: Checks that the variable which type is not the subtype of type in type pattern is not matched
                by that pattern.

  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

open class A {}
class B <: A {}
class C <: A {}

main() {
    Assert.isTrue(match(B()) {
        case foo: C => false
        case _ => true
    })
    return
}
