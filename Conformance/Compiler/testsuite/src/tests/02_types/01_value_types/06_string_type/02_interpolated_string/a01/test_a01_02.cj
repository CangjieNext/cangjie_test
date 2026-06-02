/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_02_a01_02

  @Level:         1

  @Assertion:    2.1.6.2(1) An Interpolated String is a string literal containing one or more interpolation expressions, which does not apply to multi-line raw string literals.

  @Description:  Check that interpolated string does not apply to multi-line raw string literals

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert
var myPublicTopLet0 = "${ 2 + 2 }"
public let testA0102 : String = ###"${ 2 + 2 }"###
main() {
  Assert.isTrue(myPublicTopLet0 == "4")
  Assert.isTrue(testA0102 == "\${ 2 + 2 }")
}