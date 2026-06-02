/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_03_a04_03

  @Level:         1

  @Assertion:   2.3(4) For classes and interfaces, we say two types are convertible, if one type is the superclass
                (or subclass) of another type in their class hierarchy (of course, the casting may also be fail). 
                Otherwise, they are non-convertible.

  @Description:  Check that the casting maybe non-convertible

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

open class BaseCls {}

main(): Unit {
    let b = Int32(549876)
    let b2i = b as BaseCls
    Assert.throws({ => b2i.getOrThrow() }, check: { e => e is NoneValueException })
}
