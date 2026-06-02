/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_02_a09_02

  @Level:         1

  @Assertion:     5.1.2.2(9) Parameters and their default values of a function do not belong to the function’s body.

  @Description:   Check that the variable used for parameter default value will be used from global scope, not from 
                  function body.

  @Mode:          run

  @Negative:      no

  @CompileWarning: ignore

  @Structure:     single

*/
import utils.assert.Assert

func b() {
  var myVar: Int64 = 6
  func a(x!: Int64 = myVar) { 
    var myVar: Int64 = -6
    x+x 
  }
  Assert.equals(12,a())
  myVar
}

main() {
}
