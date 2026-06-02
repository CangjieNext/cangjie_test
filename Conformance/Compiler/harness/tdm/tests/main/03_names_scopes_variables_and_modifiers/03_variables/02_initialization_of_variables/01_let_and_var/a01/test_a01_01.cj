/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         03_03_02_01_a01_01
  @Assertion:    3.3.2.1(1) There are two ways of initializing variables: initialization during declaration
                 and initialization after declaration.

  @Description:  Checks that mutable and immutable variables of various types
                 can be initialized during declaration

  @Mode:         run
  @Negative:     no
  @Structure:    single
  @Comment:

*/

import utils.assert.Assert

let CONST_FLOAT:Float64 = 1.2353546346e24

class Test {}

main() {
    let a = 1
    var numE = CONST_FLOAT
    let trigger:Bool = true
    var extremelyLongValiableNameAddedToBreakMaximumLineLengthTestingOfDifferentLanguagesLikeChineeseOrRussianIsImpossibleDueToIdentifiersCanHaveOnlyAToZLettersInBothCases:Option<Test> = Option<Test>.None;
    let str = "ABC String for testing"

    Assert.equals(1, a, reason:"Int value must match")
    Assert.equals(CONST_FLOAT, numE, reason:"Float64 value must match")
    Assert.isTrue(trigger, reason: "Boolean value should match")
    Assert.isNone(extremelyLongValiableNameAddedToBreakMaximumLineLengthTestingOfDifferentLanguagesLikeChineeseOrRussianIsImpossibleDueToIdentifiersCanHaveOnlyAToZLettersInBothCases, reason: "Instance wasn't created")
    Assert.equals("ABC String for testing", str, reason:"String value must match")
}
