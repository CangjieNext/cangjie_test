/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_01_a02_30

  @Level:         1

  @Assertion:    13.1.1(2) An unsafe context is introduced by including an unsafe
                 keyword. unsafe keyword can be used in the following situations:
                 1. qualify a block. The type of an unsafe expression is the same
                 as the type of the block.

                     unsafeExpression
                     : 'unsafe' '{' expressionOrDeclarations '}'
                     ;


  @Description:  Check if value of struct type pass through unsafe construct.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

struct Rectangle {
  var width: Int32 = 0
  var length: Int32 = 0
  init (width: Int32, length: Int32) {
    this.width = width
    this.length = length
  }
  func area(): Int32 { width * length }
}

main() {
    var Value : Rectangle = unsafe { var V : Rectangle = Rectangle(8, 20); V };
    Assert.equals(160, Value.area());
}