/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_04_a01_01

  @Level:         1

  @Assertion:    2.4(1) In case the name of a type is too long or is not intuitive in a specific scenario, type aliases
                 can be declared to create a simple and intuitive alias for a special type.
 
  @Description:  Checking the possibility of declaring aliases of types

  @Mode:         run

  @Negative:     no

*/

import utils.assert.Assert

type AVeryLongAndUnintuitiveTypeName = Int64
type SimpleTypeName = AVeryLongAndUnintuitiveTypeName
type SN = SimpleTypeName

main(): Unit {
    let a1: Int64 = 0
    let a2: AVeryLongAndUnintuitiveTypeName = 1
    let a3: SimpleTypeName = 2
    let a4: SN = 3

    Assert.isTrue(a1 is Int64)
    Assert.isTrue(a1 is AVeryLongAndUnintuitiveTypeName)
    Assert.isTrue(a1 is SimpleTypeName)
    Assert.isTrue(a1 is SN)
    
    Assert.isTrue(a2 is AVeryLongAndUnintuitiveTypeName)
    Assert.isTrue(a2 is Int64)

    Assert.isTrue(a3 is SimpleTypeName)
    Assert.isTrue(a3 is AVeryLongAndUnintuitiveTypeName)
    Assert.isTrue(a3 is Int64)

    Assert.isTrue(a4 is SN)
    Assert.isTrue(a4 is SimpleTypeName)
    Assert.isTrue(a4 is AVeryLongAndUnintuitiveTypeName)
    Assert.isTrue(a4 is Int64)
}
