/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_02_a02_02

  @Level:         1

  @Assertion:    2.1.2(2) A Rune literal consisting of a pair of single quotes and the character itself.
 
  @Description:  Check that variable initialized with pair of single quotes and characher has Rune type

  @Mode:         run 

  @Negative:     no 

  @Structure:    single
 
*/
import utils.assert.Assert

main() {
  var c = r'c'
  Assert.isTrue(c is Rune)
}