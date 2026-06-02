/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_04_01_a03_01

  @Level:         1

  @Assertion:    2.4.1(3) When using type to define a type alias for a (original) type, the original type must be 
                 visible at the place where the type definition is defined.

  @Description:  Check that can use an alias of a type if the original type is visible.

  @Mode:         run

  @Negative:     no

  @Structure:    complex-main

  @Dependencies: aux_file_01.cj

*/

import utils.assert.Assert
import aux_01.*

type SimpleTypeName = AVeryLongAndUnintuitiveTypeName
type SN = SimpleTypeName

main(): Unit {
    let a1: Float16 = 0.0
    let a2: AVeryLongAndUnintuitiveTypeName = 1.0
    let a3: SimpleTypeName = 2.0
    let a4: SN = 3.0

    Assert.isTrue(a1 is Float16)
    Assert.isTrue(a1 is AVeryLongAndUnintuitiveTypeName)
    Assert.isTrue(a1 is SimpleTypeName)
    Assert.isTrue(a1 is SN)
    
    Assert.isTrue(a2 is AVeryLongAndUnintuitiveTypeName)
    Assert.isTrue(a2 is Float16)

    Assert.isTrue(a3 is SimpleTypeName)
    Assert.isTrue(a3 is AVeryLongAndUnintuitiveTypeName)
    Assert.isTrue(a3 is Float16)

    Assert.isTrue(a4 is SN)
    Assert.isTrue(a4 is SimpleTypeName)
    Assert.isTrue(a4 is AVeryLongAndUnintuitiveTypeName)
    Assert.isTrue(a4 is Float16)
}
